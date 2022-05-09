function patientsTablesCsvWriting(data_table, patients_table_path)
%% this function takes the csv data table of all patients and split it into single patients 
% csv table and save every patient single csv table in patients_table_path

% %%----------we want to search the patient ids to create a cell array where each cell represents the patient data
% %%each patient is described by this type of id: "database id" + "_/-" + "patient number"
patients_id_all=cell2table(data_table.ptid,"VariableNames","ptid").ptid;
patients_id=[""];
for idx_cell=1:size(patients_id_all,1)
        curr_pat_id=patients_id_all{idx_cell,1}; %this is the patient id
        if ~strcmp(string(curr_pat_id),patients_id(size(patients_id,1))) %if it is a new patient
            patients_id=[patients_id; curr_pat_id]; % we add it to the patients_id array
        end %if        
end %for
patients_id(1)=[]; %remove the first row of patients  

for idx_pat=1:size(patients_id) % now, for each patient, we create a table with its data and we store them in a cell array
    curr_pat=patients_id(idx_pat);
    curr_pat_table=data_table(strcmp(curr_pat,string(data_table.ptid)),:);
    curr_pat_timetable=table2timetable(curr_pat_table(:,["Time","glucose"]));
    writetable(curr_pat_table,[patients_table_path+curr_pat+".csv"]);
end %for

end %function