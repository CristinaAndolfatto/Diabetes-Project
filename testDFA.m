clc; close all; clear all; 

subjectsWithFeatures = load("subjectsWithFeatures.mat");
subjectsWithFeatures = subjectsWithFeatures.subjectsWithFeatures;
[subjectsWithFeatures,diabeticSub,prediabeticSub,healthySub]=removeMissing(subjectsWithFeatures,15);

% Eventual other type of pre - processing

tot_D=size(diabeticSub,1); % total number of diabetic subjects
tot_P=size(prediabeticSub,1); % total number of prediabetic subjects
tot_H=size(healthySub,1); % total number of healthy subjects

%% Example of usage with specific subject and day
subject = subjectsWithFeatures{1,1};
day = "1900-01-05";
DFA = DFAfeature(subject,day);

%% Example of usage with specific subject over all his suitable days
suitableDays = daySelection(subject);
DFAvalues = zeros(length(suitableDays),1);
for i=1:length(suitableDays)
    currentDay = suitableDays{i,1};
    DFAvalues(i) = DFAfeature(subject,currentDay);
end

%% All diabetic subjects over suitable days
%DFAdiabetic = cell(tot_D,1);
DFAdiabetic = zeros(tot_D,1);
for i =1:tot_D
    currentSubject = diabeticSub{i,1};
    suitableDays = daySelection(currentSubject);

    DFAvalues = zeros(length(suitableDays),1);
    for j=1:length(suitableDays)
        currentDay = suitableDays{j,1};
        DFAvalues(j) = DFAfeature(currentSubject,currentDay);
    end
    %DFAdiabetic{i,1} = DFAvalues;
    DFAdiabetic(i) = mean(DFAvalues);
end 

%% All prediabetic subjects over suitable days
%DFAprediabetic = cell(tot_P,1);
DFAprediabetic = zeros(tot_P,1);
for i =1:tot_P
    currentSubject = prediabeticSub{i,1};
    suitableDays = daySelection(currentSubject);

    DFAvalues = zeros(length(suitableDays),1);
    for j=1:length(suitableDays)
        currentDay = suitableDays{j,1};
        DFAvalues(j) = DFAfeature(currentSubject,currentDay);
    end
    %DFAprediabetic{i,1} = DFAvalues;
    DFAprediabetic(i) = mean(DFAvalues);
end 

%% All healthy subjects over suitable days
%DFAhealthy = cell(tot_H,1);
DFAhealthy = zeros(tot_H,1);
for i =1:tot_H
    currentSubject = healthySub{i,1};
    suitableDays = daySelection(currentSubject);

    DFAvalues = zeros(length(suitableDays),1);
    for j=1:length(suitableDays)
        currentDay = suitableDays{j,1};
        DFAvalues(j) = DFAfeature(currentSubject,currentDay);
    end
    %DFAhealthy{i,1} = DFAvalues;
    DFAhealthy(i) = mean(DFAvalues);
end 
% A NaN value means that no suitable 24 hours have been found for the subject. 

%% Boxplot
A = DFAhealthy; B = DFAprediabetic; C = DFAdiabetic;
group = [ ones(size(A)); 2 * ones(size(B)); 3 * ones(size(C))];
figure(1), boxplot([A; B; C],group,'Labels',{'Healthy','Prediabetic','Diabetic'})



