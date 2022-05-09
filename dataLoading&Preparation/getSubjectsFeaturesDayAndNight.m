function [featuresDayTime,featuresNightTime] = getSubjectsFeaturesDayAndNight(subject)
%% this function select daily and nightime data and compute the variability analysis on the two type of data
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/analysis/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/errorMetrics/':
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/time/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/glycemicTransformationMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/riskMetrics/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/inspection/';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src/processing/';

% for idx_sub=1:size(subjects,1)
    curr_sub_timetable=subject.timeTableRetimed; %this is the timetable of the current subject with glucose data
    % time ranges for day and night were taken from "Dysglycemia in adults at
    % risk for or living with non-insulin treated type 2 diabetes: Insights
    % from continuous glucose monitoring", Souptik Baruaa et al
    % this sould be saved in a method getSubjectsFeaturesDayAndNight(subjects)

    %first we select the daily and nightime hours
    timetableHours=hour(curr_sub_timetable.Time); %here the hours of the glucose data
    dayTimeHours=timetableHours>=6 & timetableHours<=23; %indeces of the daily data
    nighTimeHours=timetableHours>=0 & timetableHours<6; %indeces of nightime data

    %then we select the daily and nightime data and store them in different
    %timetables

    dayTimeData=curr_sub_timetable(dayTimeHours,:); %here are stored only the daily data
    nightTimeData=curr_sub_timetable(nighTimeHours,:); %here are stored only the nightime data

    %then we compute the features on the two type of data
    featuresDayTime=analyzeGlucoseProfile(retimeGlucose(dayTimeData,5));
    featuresNightTime=analyzeGlucoseProfile(retimeGlucose(nightTimeData,5));

% end %fun
end

