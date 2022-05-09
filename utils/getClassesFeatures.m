function [allSubFeature, diabeticSubFeature, prediabeticSubFeature, healthySubFeature]=getClassesFeatures(subjects, feature)
%% this function extract the feature specified in input as a string from all subjects (allSubFeature), 
% diabetic subjects (diabeticSubFeature), prediabetic subjects (prediabeticSubFeature),
% healthy subjects (healthySubFeature)

%first we extract diabetics, prediabetics & healthy subjects with the
%function splitSubjectsClasses saved in main_dir+script/statisticalAnalysis
[diabeticSub, prediabeticSub, healthySub]=splitSubjectsClasses(subjects);

allSubFeature=[]; %here we store all the ages of the subjects
diabeticSubFeature=[]; %here we store the ages of diabetic subjects
prediabeticSubFeature=[]; %here we store the ages of prediabetic subjects
healthySubFeature=[]; %here we store the ages of healthy subjects

for idx_sub=1:size(subjects,1)
    if contains(feature,".")
        dot_count=count(feature,".");
        dot_idx=strfind(feature,".");
        feature=char(feature);
        idx_char=1;
        idx_tmp=1;
        tmp={};
        tmp{1,1}=subjects{idx_sub,1};
        for idx_dot=1:dot_count
            curr_dot_idx=dot_idx(idx_dot);
            idx_tmp=idx_tmp+1;
            tmp{idx_dot+1,1}=tmp{idx_tmp-1,1}.(feature(idx_char:curr_dot_idx-1));
            idx_char=curr_dot_idx+1;
        end %for
        curr_subject_feat=tmp{size(tmp,1),1}.(feature(dot_idx(end)+1:length(feature)));
        allSubFeature=[allSubFeature; curr_subject_feat];
    else
        curr_subject_feat=subjects{idx_sub,1}.(feature); %here there is the age of the subject
        allSubFeature=[allSubFeature; curr_subject_feat];
    end
end %for

for idx_sub=1:size(diabeticSub,1)
    if contains(feature,".")
        dot_count=count(feature,".");
        dot_idx=strfind(feature,".");
        feature=char(feature);
        idx_char=1;
        idx_tmp=1;
        tmp={};
        tmp{1,1}=diabeticSub{idx_sub,1};
        for idx_dot=1:dot_count
            curr_dot_idx=dot_idx(idx_dot);
            idx_tmp=idx_tmp+1;
            tmp{idx_dot+1,1}=tmp{idx_tmp-1,1}.(feature(idx_char:curr_dot_idx-1));
            idx_char=curr_dot_idx+1;
        end %for
        curr_subject_featD=tmp{size(tmp,1),1}.(feature(dot_idx(end)+1:length(feature)));
        diabeticSubFeature=[diabeticSubFeature; curr_subject_featD];
    else
        curr_subject_featD=diabeticSub{idx_sub,1}.(feature); %here there is the age of a diabetic
        diabeticSubFeature=[diabeticSubFeature; curr_subject_featD];
    end %if
end %for

for idx_sub=1:size(prediabeticSub,1)
    if contains(feature,".")
        dot_count=count(feature,".");
        dot_idx=strfind(feature,".");
        feature=char(feature);
        idx_char=1;
        idx_tmp=1;
        tmp={};
        tmp{1,1}=prediabeticSub{idx_sub,1};
        for idx_dot=1:dot_count
            curr_dot_idx=dot_idx(idx_dot);
            idx_tmp=idx_tmp+1;
            tmp{idx_dot+1,1}=tmp{idx_tmp-1,1}.(feature(idx_char:curr_dot_idx-1));
            idx_char=curr_dot_idx+1;
        end %for
        curr_subject_featP=tmp{size(tmp,1),1}.(feature(dot_idx(end)+1:length(feature)));
        prediabeticSubFeature=[prediabeticSubFeature; curr_subject_featP];
    else
        curr_subject_featP=prediabeticSub{idx_sub,1}.(feature); %here there is the age of a prediabetic
        prediabeticSubFeature=[prediabeticSubFeature; curr_subject_featP];
    end %if
end %for

for idx_sub=1:size(healthySub,1)
    if contains(feature,".")
        dot_count=count(feature,".");
        dot_idx=strfind(feature,".");
        feature=char(feature);
        idx_char=1;
        idx_tmp=1;
        tmp={};
        tmp{1,1}=healthySub{idx_sub,1};
        for idx_dot=1:dot_count
            curr_dot_idx=dot_idx(idx_dot);
            idx_tmp=idx_tmp+1;
            tmp{idx_dot+1,1}=tmp{idx_tmp-1,1}.(feature(idx_char:curr_dot_idx-1));
            idx_char=curr_dot_idx+1;
        end %for
        curr_subject_featH=tmp{size(tmp,1),1}.(feature(dot_idx(end)+1:length(feature)));
        healthySubFeature=[healthySubFeature; curr_subject_featH];
    else
        curr_subject_featH=healthySub{idx_sub,1}.(feature); %here there is the age of a healthy
        healthySubFeature=[healthySubFeature; curr_subject_featH];
    end %if
end %for

end %fun