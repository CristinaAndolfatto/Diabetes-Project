clc
clear all
close all

%% we add AGATA functions to the Matlab path
addpath(genpath('~/MATLAB/agata-master'));
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src';
addpath agata-master/;
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/analysis/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/variabilityMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/errorMetrics/':
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/time/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/glycemicTransformationMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/inspection/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/visualization/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/processing/';
addpath utils/
addpath statisticalAnalysis/
addpath dataLoading&Preparation/

%% data loading
main_dir="/Users/cristinaandolfatto/Desktop/Università/Collaborazione_ricerca_DiabetesClassification/dCGM_data/patients_statistics";
data_path="/Users/cristinaandolfatto/Desktop/Università/Collaborazione_ricerca_DiabetesClassification/dCGM_data/dCGM_dataset_Padova_2022-03-08.csv";
data_table=readtable(data_path);
data_table.Properties.VariableNames={'ptid_sensorid','ptid','sensorid','Time','glucose','a1C','a1Cmethod','a1CCollectionDate','label','label_with_prediabetes','age','ethnicity','gender','ht','wt','race','yearDiagnosed'};
subjectsWithFeatures=load(main_dir+"/subjectsWithNewFeatures.mat");
subjectsWithFeatures=subjectsWithFeatures.subjectsWithFeatures;
tot_subjects=size(subjectsWithFeatures,1); % total number of subjects

%% we want to see which subjetcs have less than 30 years
subLess30={};
idx=1; %initialize index on subLess30
for idx_sub=1:size(subjectsWithFeatures,1)
    if subjectsWithFeatures{idx_sub,1}.age<30 %if the age of the current subject is less than 30 years old
        subLess30{idx,1}=subjectsWithFeatures{idx_sub,1}; %we add it to the cell array subLess30
        idx=idx+1; %update the index on subLess30
    end
end
[dLess30,pLess30,hLess30]=splitSubjectsClasses(subLess30);
%% we want to divide subjects into diabetic, prediabetic and
% healthy ones

[diabeticSub,prediabeticSub,healthySub]=splitSubjectsClasses(subjectsWithFeatures);
tot_D=size(diabeticSub,1); % total number of diabetics
tot_P=size(prediabeticSub,1); % total number of prediabetics
tot_H=size(healthySub,1); % total number of healthy subjects

%% remove of subjects with more than missingThreshold % of missing samples
[subjectsWithFeatures,diabeticSub,prediabeticSub,healthySub]=removeMissing(subjectsWithFeatures,15);
tot_subjects=size(subjectsWithFeatures,1); % total number of subjects
tot_D=size(diabeticSub,1); % total number of diabetics
tot_P=size(prediabeticSub,1); % total number of prediabetics
tot_H=size(healthySub,1); % total number of healthy subjects

%% new features computation: DFA
DFA = zeros(numel(subjectsWithFeatures),1);
for i =1:numel(subjectsWithFeatures)
    currentSubject = subjectsWithFeatures{i,1};
    suitableDays = daySelection(currentSubject);

    DFAvalues = zeros(length(suitableDays),1);
    for j=1:length(suitableDays)
        currentDay = suitableDays{j,1};
        DFAvalues(j) = DFAfeature(currentSubject,currentDay);
    end
    DFAcell{i,1} = DFAvalues;
    subjectsWithFeatures{i,1}.features.variability.DFAvalues=DFAvalues;
%     meanDFA(i) = mean(DFAvalues);
end 

%% new features computation: AIPE
AIPEvalues=zeros(numel(subjectsWithFeatures),9);
%length of subsequences to test
m=(2:9);
for idx_sub=1:numel(subjectsWithFeatures)
    curr_sub_timetable=subjectsWithFeatures{idx_sub,1}.timeTableImputed;
    % the current subject glucose values time series
    currSubjectGlucose=curr_sub_timetable.glucose;
    for idx_m=1:numel(m)
        curr_m=m(idx_m);
        curr_AIPE=AIPE(currSubjectGlucose,curr_m);
        AIPEvalues(idx_sub,m(idx_m))=curr_AIPE;
        subjectsWithFeatures{idx_sub,1}.features.variability.AIPEvalues=AIPEvalues(idx_sub,:);
    end %for
end %for
% ANOVA test for selection of the optimal "m value" for AIPE computation
% "optimal m value": statistically different distribution of AIPE value in the three population (healthy, prediabetics, diabetics)
feature="features.variability.AIPEvalues";
[allSubFeature, diabeticSubFeature, prediabeticSubFeature, healthySubFeature]=getClassesFeatures(subjectsWithFeatures,feature);
% test for m=9
m=9;
AIPEhealthy=healthySubFeature(:,m);
AIPEdiabetics=diabeticSubFeature(:,m);
AIPEprediabetics=prediabeticSubFeature(:,m);
AIPEall=[AIPEhealthy', AIPEprediabetics', AIPEdiabetics'];
group1="healthy";
group2="prediabetic";
group3="diabetic";
for count=1:length(AIPEhealthy)-1
    group1=[group1, "healthy"];
end
for count=1:length(AIPEprediabetics)-1
    group2=[group2, "prediabetic"];
end
for count=1:length(AIPEdiabetics)-1
    group3=[group3, "diabetic"];
end
groups=[group1,group2,group3];
[p,tbl,stats]=anova1(AIPEall,groups);
[c,m,h,gnames] = multcompare(stats);

%% new features computation: MSE on windows of 72 hours
beginWindow=1;
window_number=1;
window_size=864;
maxNaN=window_size/6;
MSEvalues=[];
for idx_sub=1:numel(subjectsWithFeatures)
    curr_subject_timetable=subjectsWithFeatures{idx_sub,1}.timeTableImputed;
    beginWindow=1;
    while beginWindow<(size(curr_subject_timetable,1)-(window_size+1))
          curr_data_window=curr_subject_timetable(beginWindow:beginWindow+(window_size-1),:);
          if sum(isnan(curr_data_window.glucose))<maxNaN
              windows(window_number,:)=curr_data_window.glucose;
              window_number=window_number+1;
              [curr_MSE]=MSE_complexity_index(curr_data_window);
              MSEvalues=[MSEvalues; curr_MSE];
          end
          beginWindow=beginWindow+(window_size-1);
    end %while
    subjectsWithFeatures{idx_sub,1}.features.variability.MSEvalue=mean(MSEvalues);
end %for

%% addiction of optimal AIPE value and mean DFA value to the subjects features
for idx_sub=1:size(subjectsWithFeatures)
    subjectsWithFeatures{idx_sub,1}.features.variability.AIPEottimo=subjectsWithFeatures{idx_sub,1}.features.variability.AIPEvalues(9);
    subjectsWithFeatures{idx_sub,1}.features.variability.DFAmean=mean(subjectsWithFeatures{idx_sub,1}.features.variability.DFAvalues);
    subjectsWithFeatures{idx_sub,1}.features.variability=rmfield(subjectsWithFeatures{idx_sub,1}.features.variability,"MSEvalues");
end

%% boxplot of new features
featuresBoxPlots(subjectsWithFeatures);