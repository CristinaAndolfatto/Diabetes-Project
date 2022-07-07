clc; close all; clear all; 

% Subjects without 1st day, with 5 consecutive days and <10% of missing values
subjectsWithFeatures = load("subjectsWithNewFeatureWithoutFirstDay.mat");
subjectsWithFeatures = subjectsWithFeatures.subjectsWithFeatures;
[subjectsWithFeatures,diabeticSub,prediabeticSub,healthySub]=removeMissing(subjectsWithFeatures,15);

tot_D=size(diabeticSub,1); % total number of diabetic subjects
tot_P=size(prediabeticSub,1); % total number of prediabetic subjects
tot_H=size(healthySub,1); % total number of healthy subjects

%% Example of usage with specific subject over all his suitable days
subject = subjectsWithFeatures{1,1};
suitableOverlappingDays = daySelection2(subject);
DFAvalues = zeros(length(suitableOverlappingDays),1);
for i=1:length(suitableOverlappingDays)
    currentDay = suitableOverlappingDays{i,1};
    DFAvalues(i) = DFAfeature2(currentDay);
end

%% All diabetic subjects over suitable overlapping days
%DFAdiabetic = cell(tot_D,1);
DFAdiabeticMean = zeros(tot_D,1);
DFAdiabeticMax = zeros(tot_D,1);
DFAdiabeticMedian = zeros(tot_D,1);

for i = 1:tot_D % cycle of subjects
    currentSubject = diabeticSub{i,1};
    suitableOverlappingDays = daySelection2(currentSubject);

    DFAvalues = zeros(length(suitableOverlappingDays),1);
    for j=1:length(suitableOverlappingDays) %cycle of suitableOverlappingDays of currentSubject
        currentDay = suitableOverlappingDays{j,1};
        DFAvalues(j) = DFAfeature2(currentDay);
    end
    %DFAdiabetic{i,1} = DFAvalues;
    DFAdiabeticMean(i) = mean(DFAvalues);
    DFAdiabeticMax(i) = max(DFAvalues);
    DFAdiabeticMedian(i) = median(DFAvalues);
end 

%% All prediabetic subjects over suitable overlapping days
%DFAprediabetic = cell(tot_P,1);
DFAprediabeticMean = zeros(tot_P,1);
DFAprediabeticMax = zeros(tot_P,1);
DFAprediabeticMedian = zeros(tot_P,1);

for i = 1:tot_P % cycle of subjects
    currentSubject = prediabeticSub{i,1};
    suitableOverlappingDays = daySelection2(currentSubject);

    DFAvalues = zeros(length(suitableOverlappingDays),1);
    for j=1:length(suitableOverlappingDays) %cycle of suitableOverlappingDays of currentSubject
        currentDay = suitableOverlappingDays{j,1};
        DFAvalues(j) = DFAfeature2(currentDay);
    end
    %DFAprediabetic{i,1} = DFAvalues;
    DFAprediabeticMean(i) = mean(DFAvalues);
    DFAprediabeticMax(i) = max(DFAvalues);
    DFAprediabeticMedian(i) = median(DFAvalues);
end 

%% All healthy subjects over suitable overlapping days
%DFAhealthy = cell(tot_H,1);
DFAhealthyMean = zeros(tot_H,1);
DFAhealthyMax = zeros(tot_H,1);
DFAhealthyMedian = zeros(tot_H,1);

for i = 1:tot_H % cycle of subjects
    currentSubject = healthySub{i,1};
    suitableOverlappingDays = daySelection2(currentSubject);

    DFAvalues = zeros(length(suitableOverlappingDays),1);
    for j=1:length(suitableOverlappingDays) %cycle of suitableOverlappingDays of currentSubject
        currentDay = suitableOverlappingDays{j,1};
        DFAvalues(j) = DFAfeature2(currentDay);
    end
    %DFAhealthy{i,1} = DFAvalues;
    DFAhealthyMean(i) = mean(DFAvalues);
    if isempty(DFAvalues)
        DFAhealthyMax(i) = NaN;
        DFAhealthyMedian(i) = NaN;
    else
        DFAhealthyMax(i) = max(DFAvalues);
        DFAhealthyMedian(i) = median(DFAvalues);
    end
end 

%% Boxplot
A = DFAhealthyMean; B = DFAprediabeticMean; C = DFAdiabeticMean;
group = [ ones(size(A)); 2 * ones(size(B)); 3 * ones(size(C))];
figure(1), sgtitle('DFA - Mean value'), boxplot([A; B; C],group,'Labels',{'Healthy','Prediabetic','Diabetic'})

A = DFAhealthyMax; B = DFAprediabeticMax; C = DFAdiabeticMax;
group = [ ones(size(A)); 2 * ones(size(B)); 3 * ones(size(C))];
figure(2), sgtitle('DFA - Max value'), boxplot([A; B; C],group,'Labels',{'Healthy','Prediabetic','Diabetic'})

A = DFAhealthyMedian; B = DFAprediabeticMedian; C = DFAdiabeticMedian;
group = [ ones(size(A)); 2 * ones(size(B)); 3 * ones(size(C))];
figure(3), sgtitle('DFA - Median value'), boxplot([A; B; C],group,'Labels',{'Healthy','Prediabetic','Diabetic'})



