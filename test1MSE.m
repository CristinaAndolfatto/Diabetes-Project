clear all
close all
clc

load subjectsWithFeatures.mat

%% Divide subjects into diabetic, prediabetic and healthy ones
[diabeticSub,prediabeticSub,healthySub]=splitSubjectsClasses(subjectsWithFeatures);
tot_D=size(diabeticSub,1); % total number of diabetics
tot_P=size(prediabeticSub,1); % total number of prediabetics
tot_H=size(healthySub,1); % total number of healthy subjects

%% Remove subjects with more than missingThreshold % of missing samples
[subjectsWithFeatures,diabeticSub,prediabeticSub,healthySub]=removeMissing(subjectsWithFeatures,15);
tot_subjects=size(subjectsWithFeatures,1); % total number of subjects
tot_D=size(diabeticSub,1); % total number of diabetics
tot_P=size(prediabeticSub,1); % total number of prediabetics
tot_H=size(healthySub,1); % total number of healthy subjects

%% MSE of a specific diabetic subject
subj1=diabeticSub{1,1};
[MSE1]=MSE_complexity_index(subj1);

%% MSE of a specific prediabetic subject
subj2=prediabeticSub{1,1};
[MSE2]=MSE_complexity_index(subj2);

%% MSE of a specific healthy subject
subj3=healthySub{1,1};
[MSE3]=MSE_complexity_index(subj3);

%% Average MSE of the diabetic subjects 
for i=1:tot_D
    subj_D=diabeticSub{i,1};
    [MSE_D]=MSE_complexity_index(subj_D);
    MSE_diabetic(i)=MSE_D;
end
MSE_average_diabetic=mean(MSE_diabetic);
MSE_std_diabetic=std(MSE_diabetic);
MSE_SE_diabetic=MSE_std_diabetic/sqrt(tot_D);

%% Average MSE of the prediabetic subjects 
for i=1:tot_P
    subj_P=prediabeticSub{i,1};
    [MSE_P]=MSE_complexity_index(subj_P);
    MSE_prediabetic(i)=MSE_P;
end
MSE_average_prediabetic=mean(MSE_prediabetic);
MSE_std_prediabetic=std(MSE_prediabetic);
MSE_SE_prediabetic=MSE_std_prediabetic/sqrt(tot_P);

%% Average MSE of the healthy subjects 
for i=1:tot_H
    subj_H=healthySub{i,1};
    [MSE_H]=MSE_complexity_index(subj_H);
    MSE_healthy(i)=MSE_H;
end
MSE_average_healthy=mean(MSE_healthy);
MSE_std_healthy=std(MSE_healthy);
MSE_SE_healthy=MSE_std_healthy/sqrt(tot_H);

%% 
%% new features: MSE
for i=1:1%numel(glucotypesSubjects)
    subj=glucotypesSubjects{i,1};
    [MSEvalues]=MSE_complexity_index(subj);
    glucotypesSubjects{i,1}.features.variability.MSEvalues=MSEvalues;
end
