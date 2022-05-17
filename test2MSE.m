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

%% Define the largest scale factor for the computation of the MSE index
M=7;

%% MSE plot of a specific diabetic subject
subj1=diabeticSub{1,1};
[MSE1,S1]=complexity_indexes(subj1);

figure(1)
plot(1:M,S1,'bo-')
xlabel('Scale Factor')
ylabel('Sample Entropy')
title('Diabetic subject')

%% MSE plot of a specific prediabetic subject
subj2=prediabeticSub{1,1};
[MSE2,S2]=complexity_indexes(subj2);

figure(2)
plot(1:M,S2,'bo-')
xlabel('Scale Factor')
ylabel('Sample Entropy')
title('Prediabetic subject')

%% MSE plot of a specific healthy subject
subj3=healthySub{1,1};
[MSE3,S3]=complexity_indexes(subj3);

figure(3)
plot(1:M,S3,'bo-')
xlabel('Scale Factor')
ylabel('Sample Entropy')
title('Healthy subject')

%% Average MSE of the diabetic subjects 
for i=1:tot_D
    subj_D=diabeticSub{i,1};
    [MSE_D,S_D]=complexity_indexes(subj_D);
    sample_en_diabetic(i,:)=S_D;
    MSE_diabetic(i)=MSE_D;
end
MSE_average_diabetic=mean(MSE_diabetic);
MSE_std_diabetic=std(MSE_diabetic);
MSE_SE_diabetic=MSE_std_diabetic/sqrt(tot_D);
sample_en_average_diabetic=mean(sample_en_diabetic,1);
sample_en_std_diabetic=std(sample_en_diabetic,1);
sample_en_SE_diabetic=sample_en_std_diabetic/sqrt(tot_D);

%% Average MSE of the prediabetic subjects 
for i=1:tot_P
    subj_P=prediabeticSub{i,1};
    [MSE_P,S_P]=complexity_indexes(subj_P);
    sample_en_prediabetic(i,:)=S_P;
    MSE_prediabetic(i)=MSE_P;
end
MSE_average_prediabetic=mean(MSE_prediabetic);
MSE_std_prediabetic=std(MSE_prediabetic);
MSE_SE_prediabetic=MSE_std_prediabetic/sqrt(tot_P);
sample_en_average_prediabetic=mean(sample_en_prediabetic,1);
sample_en_std_prediabetic=std(sample_en_prediabetic,1);
sample_en_SE_prediabetic=sample_en_std_prediabetic/sqrt(tot_P);

%% Average MSE of the healthy subjects 
for i=1:tot_H
    subj_H=healthySub{i,1};
    [MSE_H,S_H]=complexity_indexes(subj_H);
    sample_en_healthy(i,:)=S_H;
    MSE_healthy(i)=MSE_H;
end
MSE_average_healthy=mean(MSE_healthy);
MSE_std_healthy=std(MSE_healthy);
MSE_SE_healthy=MSE_std_healthy/sqrt(tot_H);
sample_en_average_healthy=mean(sample_en_healthy,1);
sample_en_std_healthy=std(sample_en_healthy,1);
sample_en_SE_healthy=sample_en_std_healthy/sqrt(tot_H);

%% Average MSE plots of the diabetic subjects, the prediabetic subjects and the healthy subjects

figure(4)
errorbar(1:M,sample_en_average_diabetic,sample_en_SE_diabetic,'o-')
hold on
errorbar(1:M,sample_en_average_prediabetic,sample_en_SE_prediabetic,'o-')
errorbar(1:M,sample_en_average_healthy,sample_en_SE_healthy,'o-')
xlabel('Scale Factor')
ylabel('Sample Entropy')
legend('diabetic','prediabetic','healthy')