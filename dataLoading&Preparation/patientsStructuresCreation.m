function [patients,patients_id]=patientsStructuresCreation(data_table, patients_structures_path)
%% we try to create an array of structures, each row/structure represents a
% single patient with its data

%extract patients ids from the data_table
patients_id_all=cell2table(data_table.ptid,"VariableNames","ptid").ptid;
patients_id=[""];
for idx_cell=1:size(patients_id_all,1)
        curr_pat_id=patients_id_all{idx_cell,1}; %this is the patient id
        if ~strcmp(string(curr_pat_id),patients_id(size(patients_id,1))) %if it is a new patient
            patients_id=[patients_id; curr_pat_id]; % we add it to the patients_id array
        end %if        
end %for
patients_id(1)=[]; %remove the first row of patients

%creation of the cell array of patients (each one represented with a structure with several fields)
patients={};
for idx_pat=1:size(patients_id) % now, for each patient, we create a table with its data and we store them in a cell array
    curr_pat=patients_id(idx_pat); %curr patient name
    curr_pat_table=data_table(strcmp(curr_pat,string(data_table.ptid)),:); %curr patient file
    curr_pat_timetable=table2timetable(curr_pat_table(:,["Time","glucose"])); %curr patient timetable
    curr_pat_timetable_retimed=retimeGlucose(curr_pat_timetable,5); % we do a retime 
    curr_pat_label=curr_pat_table.label(1);
    curr_pat_labelWithPrediabetes=curr_pat_table.label_with_prediabetes(1);
    curr_pat_age=curr_pat_table.age(1);
    curr_pat_ethnicity=curr_pat_table.ethnicity(1);
    curr_pat_gender=curr_pat_table.gender(1);
    curr_pat_ht=curr_pat_table.ht(1);
    curr_pat_wt=curr_pat_table.wt(1);
    curr_pat_race=curr_pat_table.race(1);
    curr_pat_year_diagosed=curr_pat_table.yearDiagnosed(1);

    curr_pat_struct=struct('patientID',curr_pat,'dataTable',curr_pat_table,'timeTable',curr_pat_timetable,'timeTableRetimed',curr_pat_timetable_retimed,'label',curr_pat_label,'labelWithPreDiabetes',curr_pat_labelWithPrediabetes,'age',curr_pat_age,'ethnicity',curr_pat_ethnicity,'gender',curr_pat_gender,'ht',curr_pat_ht,'wt',curr_pat_wt,'race',curr_pat_race,'yearDiagnosed',curr_pat_year_diagosed);

    save(char([patients_structures_path+curr_pat+".mat"]),'-struct', 'curr_pat_struct');
    patients{idx_pat,1}=curr_pat_struct; %manca da capire come aggiungere paziente alla struct finale
end %for 

end %function