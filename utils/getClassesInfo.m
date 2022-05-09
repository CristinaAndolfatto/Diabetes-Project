function [featAll,featD,featP,featH]=getClassesInfo(subjects, info)
%this function takes the info specified in input (like "race") of all
%subjects and then of diabetic,prediabetic and healthy subjects
featAll=[]; %here the features of all sibjects
featD=[]; %here there are the features of diabetic sub
featP=[]; %here there are the features of pre-diabetic sub
featH=[]; %here there are the features of healthy sub
for idx_sub=1:size(subjects,1)
    curr_sub=subjects{idx_sub,1};
    featAll=[featAll, string(curr_sub.(info))]; %here we add the info requested to the subjects array
    if curr_sub.labelWithPreDiabetes==0 %if it is healthy
        featH=[featH, string(curr_sub.(info))];
    elseif curr_sub.labelWithPreDiabetes==2 % if the label is T2D
        featD=[featD, string(curr_sub.(info))];
     elseif curr_sub.labelWithPreDiabetes==3 % if the label is Prediabetes
        featP=[featP, string(curr_sub.(info))];
    else
        print("Error, there are non expected labels"); % we check if there are wrong labeles
    end %if
end %for
end %fun