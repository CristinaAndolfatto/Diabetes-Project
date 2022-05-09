function [D_F,D_M,P_F,P_M,H_F,H_M]=splitSubjectsGender(subjects);
%% this function finds the female and male subjects of each of the three classes (D=diabetic, P=prediabetic, H=healthy)
% and save them in the cell arrays X_Y (where X=type of subject (Diabetic/Prediabetic/Healthy), Y=gender of the subject (Female/Male))
if nargout==6 % if we want female and male and the three classes
tot_subjects=size(subjects,1);
tot_DF=0; tot_DM=0; % initialization of the number of diabetic females and males
tot_PF=0; tot_PM=0; % initialization of the number of prediabetic females and males
tot_HF=0; tot_HM=0; % initialization of the number of healthy females and males
D_F={}; D_M={}; % initialization of the arrays with diabetic females and males
P_F={}; P_M={}; % initialization of the arrays with prediabetic females and males
H_F={}; H_M={}; % initialization of the arrays with healthy females and males

for idx_pat=1:tot_subjects
    curr_patient=subjects{idx_pat,1}; %here we have the struct with the current patient
    if curr_patient.labelWithPreDiabetes==0 %if it is healthy
        if strcmp(string(curr_patient.gender),"F") % if it is an healthy female
            tot_HF=tot_HF+1; % we update the count of healthy female subjects
            H_F{tot_HF,1}=curr_patient; % we add the subjects to the healthy female subjects
        else
            tot_HM=tot_HM+1; % we update the count of healthy male subjects
            H_M{tot_HM,1}=curr_patient; % we add the subjects to the healthy male subjects
        end %if
    elseif curr_patient.labelWithPreDiabetes==2 % if the label is T2D
        if strcmp(string(curr_patient.gender),"F") % if it is a diabetic female
            tot_DF=tot_DF+1; % we update the count of diabetic female subjects
            D_F{tot_DF,1}=curr_patient; % we add the subjects to the diabetic female subjects
        else
            tot_DM=tot_DM+1; % we update the count of diabetic male subjects
            D_M{tot_DM,1}=curr_patient; % we add the subjects to the diabetic male subjects
        end
     elseif curr_patient.labelWithPreDiabetes==3 % if the label is Prediabetes
        if strcmp(string(curr_patient.gender),"F") % if it is a prediabetic female
            tot_PF=tot_PF+1; % we update the count of prediabetic female subjects
            P_F{tot_PF,1}=curr_patient; % we add the subjects to the prediabetic female subjects
        else
            tot_PM=tot_PM+1; % we update the count of prediabetic male subjects
            P_M{tot_PM,1}=curr_patient; % we add the subjects to the prediabetic male subjects
        end
    else
        print("Error, there are non expected labels"); % we check if there are wrong labeles
    end %if   
end %for
elseif nargout==2 %if we want only females and males 
    tot_subjects=size(subjects,1);
    D_F={}; D_M={}; tot_DF=0; tot_DM=0;
    for idx_pat=1:tot_subjects
    curr_patient=subjects{idx_pat,1}; %here we have the struct with the current patient
        if strcmp(string(curr_patient.gender),"F") % if it is a diabetic female
            tot_DF=tot_DF+1; % we update the count of diabetic female subjects
            D_F{tot_DF,1}=curr_patient; % we add the subjects to the diabetic female subjects
        else
            tot_DM=tot_DM+1; % we update the count of diabetic male subjects
            D_M{tot_DM,1}=curr_patient; % we add the subjects to the diabetic male subjects
        end %if   
end %for

end %function