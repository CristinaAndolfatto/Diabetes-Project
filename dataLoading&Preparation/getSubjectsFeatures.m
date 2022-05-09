function [subjectsWithFeatures] = getSubjectsFeatures(subjects)
%% this function extract with the method analyzeGlucoseProfile the features from the 
% subjects glucose profiles saved in cell array "subjects", 
% add the mean HbA1c value and also the features on daily and nightly data

subjectsWithFeatures=subjects;
for idx_sub=1:size(subjectsWithFeatures,1)
    curr_sub=subjectsWithFeatures{idx_sub,1}; %current subjects
    curr_sub_timetable=subjectsWithFeatures{idx_sub,1}.timeTableRetimed; %timetable retimed
    curr_sub_table=subjectsWithFeatures{idx_sub,1}.dataTable; %table with all the features
    
    subjectsWithFeatures{idx_sub,1}.features=analyzeGlucoseProfile(curr_sub_timetable);
    % we also compute mean HbA1c levels and we add it to the variability features
    subjectsWithFeatures{idx_sub,1}.features.variability.meanHbA1c=mean(curr_sub_table.a1C);
    subjectsWithFeatures{idx_sub,1}.features.variability.sdHbA1c=std(curr_sub_table.a1C);

    % then we use the AGATA function "analyzeGlucoseProfile" on daily and
    % night data through the function "getSubjectFeaturesDayAndNight" and save them in the fields
    % subjectsWithFeatures.features.daytimeAnalysis.day e
    % subjectsWithFeatures.features.daytimeAnalysis.night

    [subjectsWithFeatures{idx_sub,1}.features.daytimeAnalysis.day,subjectsWithFeatures{idx_sub,1}.features.daytimeAnalysis.night]=getSubjectsFeaturesDayAndNight(curr_sub);

end %for
end

