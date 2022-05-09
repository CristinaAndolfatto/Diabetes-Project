clc
clear all
close all

% we add AGATA functions to the Matlab path
% addpath(genpath('~/MATLAB/agata-master'));
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src';
% addpath agata-master/;
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/analysis/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/variabilityMetrics/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/errorMetrics/':
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/time/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/glycemicTransformationMetrics/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/inspection/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/visualization/';
% addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/processing/';
% addpath utils/
% addpath statisticalAnalysis/
% addpath dataLoading&Preparation/

%% data loading
main_dir="/Users/cristinaandolfatto/Desktop/Università/Collaborazione_ricerca_DiabetesClassification/dCGM_data/patients_statistics";
data_path="/Users/cristinaandolfatto/Desktop/Università/Collaborazione_ricerca_DiabetesClassification/dCGM_data/dCGM_dataset_Padova_2022-03-08.csv";
data_table=readtable(data_path);
data_table.Properties.VariableNames={'ptid_sensorid','ptid','sensorid','Time','glucose','a1C','a1Cmethod','a1CCollectionDate','label','label_with_prediabetes','age','ethnicity','gender','ht','wt','race','yearDiagnosed'};
subjectsWithFeatures=load(main_dir+"/subjectsWithFeatures.mat");
subjectsWithFeatures=subjectsWithFeatures.subjectsWithFeatures;
tot_subjects=size(subjectsWithFeatures,1); % total number of subjects

%% we want to divide subjects into diabetic, prediabetic and
% healthy ones

[diabeticSub,prediabeticSub,healthySub]=splitSubjectsClasses(subjectsWithFeatures);
tot_D=size(diabeticSub,1); % total number of diabetics
tot_P=size(prediabeticSub,1); % total number of prediabetics
tot_H=size(healthySub,1); % total number of healthy subjects

%% remove of subjects with more than missingThreshold % of missing samples
[subjectsWithFeatures2,diabeticSub2,prediabeticSub2,healthySub2]=removeMissing(subjectsWithFeatures,15);

