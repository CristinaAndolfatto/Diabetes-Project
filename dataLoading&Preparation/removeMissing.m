function [subjectsWithoutMissing,diabeticSubWithoutMissing,prediabeticSubWithoutMissing,healthySubWithoutMissing]=removeMissing(subjectsWithFeatures,missingThreshold)
%% this function removes subjects with more than missingThreshold % of missing samples

subjectsWithoutMissing=subjectsWithFeatures;
for idx_sub=1:size(subjectsWithFeatures,1)
    curr_sub_missing=subjectsWithFeatures{idx_sub,1}.features.dataQuality.missingGlucosePercentage;
    if curr_sub_missing>missingThreshold
        subjectsWithoutMissing{idx_sub,1}=[];
        subjectsWithoutMissing(idx_sub,:)=[];
    end
end
[diabeticSubWithoutMissing, prediabeticSubWithoutMissing, healthySubWithoutMissing]=splitSubjectsClasses(subjectsWithoutMissing);