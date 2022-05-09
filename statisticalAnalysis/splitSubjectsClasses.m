function [D_subjects, P_subjects, H_subjects]=splitSubjectsClasses(subjects)
%% this function splits the subjects into diabetic (D_subjects), prediabetic (P_subjects) and healthy subjects (H_subjects)
% saved in subjects (cell array with the subjects structures)
% we want to count the number of subjects for each class (D=Diabetic, P=prediabetic, H=healthy)
tot_subjects=size(subjects,1);
tot_D=0;
tot_P=0;
tot_H=0; 
D_subjects={};
P_subjects={};
H_subjects={};
for idx_pat=1:tot_subjects
    curr_patient=subjects{idx_pat,1}; %here we have the struct with the current patient
    if curr_patient.labelWithPreDiabetes==0 %if it is healthy
        tot_H=tot_H+1; % we update the count of healthy subjects
        H_subjects{tot_H,1}=curr_patient; % we add the subjects to the healthy subjects
    elseif curr_patient.labelWithPreDiabetes==2 % if the label is T2D
        tot_D=tot_D+1; % we update the T2D count
        D_subjects{tot_D,1}=curr_patient; % we add the subject to the diabetic subjects
    elseif curr_patient.labelWithPreDiabetes==3 % if the label is Prediabetes
        tot_P=tot_P+1; % we update the Prediabetes count
        P_subjects{tot_P,1}=curr_patient; % we add the subject to the prediabetic subjects
    else
        print("Error, there are non expected labels"); % we check if there are wrong labeles
    end %if   
end %for

end %function