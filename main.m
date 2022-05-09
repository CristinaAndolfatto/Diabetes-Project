clc
clear all
close all

% we add AGATA functions to the Matlab path
addpath(genpath('~/MATLAB/agata-master'));
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master';
addpath '/Users/cristinaandolfatto/Documents/MATLAB/agata-master/src';
addpath utils/
addpath statisticalAnalysis/
addpath dataLoading&Preparation/


%% dCGM data loading from CSV files
main_dir="/Users/cristinaandolfatto/Desktop/Università/Collaborazione_ricerca_DiabetesClassification/dCGM_data/";
data_path=main_dir+"dCGM_dataset_Padova_2022-03-08.csv";
data_table=readtable(data_path);
data_table.Properties.VariableNames={'ptid_sensorid','ptid','sensorid','Time','glucose','a1C','a1Cmethod','a1CCollectionDate','label','label_with_prediabetes','age','ethnicity','gender','ht','wt','race','yearDiagnosed'};

%% dCGM patients structures computation (saved in patients_structures_path) & creation of the array of patients structures
patients_structures_path=main_dir+"patients_structures/";
[subjects,subjects_id]=patientsStructuresCreation(data_table, patients_structures_path);

%% dCGM patients structures with features computation: we use AGATA tool to compute the GV features
subjectsWithFeatures=getSubjectsFeatures(subjects);

%% ----------statistical analysis on subjects:some examples---------- %%

%% first of all, we want to divide subjects into diabetic, prediabetic and
% healthy ones

[diabeticSub,prediabeticSub,healthySub]=splitSubjectsClasses(subjectsWithFeatures);
tot_D=size(D_subjects,1); % total number of diabetics
tot_P=size(P_subjects,1); % total number of prediabetics
tot_H=size(H_subjects,1); % total number of healthy subjects

%% remove of subjects with more than missingThreshold % of missing samples
[subjectsWithFeatures,diabeticSub,prediabeticSub,healthySub]=removeMissing(subjectsWithFeatures,15);

% %% now, we want to see which are females and males in the three classes
% [D_F,D_M,P_F,P_M,H_F,H_M]=splitSubjectsGender(subjectsWithFeatures);
% tot_DF=size(D_F,1); tot_DM=size(D_M,1); % number of diabetic females and males
% tot_PF=size(P_F,1); tot_PM=size(P_M,1); % number of prediabetic females and males
% tot_HF=size(H_F,1); tot_HM=size(H_M,1); % number of healthy females and males
% save(main_dir+"/patients_statistics/DiabeticFemales.mat",'D_F','-mat');
% save(main_dir+"/patients_statistics/DiabeticMales.mat",'D_M','-mat');
% save(main_dir+"/patients_statistics/PreDiabeticFemales.mat",'P_F','-mat');
% save(main_dir+"/patients_statistics/PreDiabeticMales.mat",'P_M','-mat');
% save(main_dir+"/patients_statistics/HealthyFemales.mat",'H_F','-mat');
% save(main_dir+"/patients_statistics/HealthyMales.mat",'H_M','-mat');
% 
% %% we want to count the total number of glucose samples and the mean number of glucose samples per patient
% tot_subjects=size(subjects,1); % total number of subjects
% samples_num=[];
% for idx_subject=1:tot_subjects
%     curr_subject=subjects{idx_subject,1}; %this is the current subject
%     curr_sub_samples=size(curr_subject.dataTable,1); %number of samples for the current subject
%     samples_num(idx_subject,1)=curr_sub_samples;
% end %for
% tot_samples=sum(samples_num); %total number of samples
% mean_samples=mean(samples_num); %mean number of samples per subject
% sd_samples=std(samples_num); %sd of the mean number of samples per subject
% % distribution of the number of samples, ordered from the subject with less
% % samples to the subject with the highest number of glucose samples
% subjects_table=table(subjects_id,samples_num,'VariableNames',{'SubjectsId','SamplesNumb'});
% subjects_table_ordered=sortrows(subjects_table,2);
% subjectsID_ordered=categorical(subjects_table_ordered.SubjectsId);
% subjectsID_ordered=reordercats(subjectsID_ordered,subjects_table_ordered.SubjectsId);
% f=figure();
% hold on
% b=bar(subjectsID_ordered,sort(samples_num));
% ax=gca(f);
% ax.XAxis.FontSize=4;
% b.FaceColor='flat';
% yticks([0:200:max(samples_num)+5]);
% title("Number of samples for each subject",'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic');
% xlabel("SubjectID",'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic');
% ylabel("Number of samples",'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic');
% ylim([0; max(samples_num)+5]);
% b.FaceColor=[96/255 130/255 182/255];
% hold off
% 
% %% we want also to create a pie chart with the percentages of subjects with
% % less than one week, at least one/max 2 weeks of data, more than 2 weeks
% % the sample rate is about 5 min, so in one day we should have 24 hour*60
% % min= 1440 min -> 1440 min/ 5 min= 288 glucose samples -> 288 samples per day x 7 days= 2016 samples per week
% % so we divide subjects in subjects with #samples < 2016 (subLess1Week), subjects with 2016 < #samples < 4032 (sub1_2Week), subjects with #samples> 4032 (subMoreWeeks)  
% 
% countLess1Week=0;
% count1_2Weeks=0;
% countMoreWeeks=0;
% for idx_sub=1:size(samples_num,1)
%     curr_numb_samples=samples_num(idx_sub); %this is the number of glucose samples
%     if curr_numb_samples <= 2016 % if the subject has less than one week of data
%         countLess1Week=countLess1Week+1; % we update the count of subjects with less than one week of data
%     elseif (curr_numb_samples>2016) && (curr_numb_samples<=4032) % if the subject has 1-2 weeks of data
%         count1_2Weeks=count1_2Weeks+1; % we update the count of subjects with 1-2 weeks of data
%     elseif curr_numb_samples>4032 % if the subject has more than 2 weeks of data
%         countMoreWeeks=countMoreWeeks+1; % we update the count of subjects with more than 2 weeks of data
%     end
% end
% %we want to calculate the percentage of each category
% num_sub_per_week=[countLess1Week, count1_2Weeks, countMoreWeeks];
% f2=figure();
% p=pie3(num_sub_per_week);
% legend({"% of patients with less than one week of data","% of subjects with 1-2 weeks of data","% of subjects with more than 2 weeks of data"});
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender
%     96/255 130/255 182/255 ; %blu grigietto
%     0/255	86/255	63/255 ; %verde    
%     ];
% ax.Colormap = newColors;
% 
% %% now we want to see the distribution of the age in the entire dataset vs the diabetic vs the prediabetic vs the healthy people
% 
% [ages, agesD, agesP, agesH]=getClassesFeatures(subjectsWithFeatures,"age");
% 
% % now we create a plot divided in 4 subplots with the distribution of ages
% % in all subjects, in diabetics, in prediabetics, in healthy sub
% figure();
% subplot(221)
% h1=histogram(ages,'BinWidth',5);
% h1.FaceColor=[96/255 130/255 182/255];
% h1.LineWidth=1;
% ylim([0 40]);
% yticks(0:5:40);
% xticks(0:5:max(ages));
% title("Ages distribution of all classes",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
% ylabel("Number of subjects",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% xlabel("Age",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% ax=gca();
% ax.YGrid='on';
% ax.YMinorTick='on';
% text(60,37,["Mean age: " + floor(mean(ages)) + " yrs (" + "{\pm}" + floor(std(ages))+")"],'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic','EdgeColor',[0 0 0],'LineWidth',1,'BackgroundColor',[.8 .8 .8]);
% subplot(222)
% h2=histogram(agesD,'BinWidth',5);
% h2.FaceColor=[180/255	0/255	0/255];
% h2.LineWidth=1;
% ylim([0 8]);
% yticks(0:1:8);
% xticks(0:5:max(agesD));
% title("Ages distribution of diabetic subjects",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
% ylabel("Number of subjects",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% xlabel("Age",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% ax=gca();
% ax.YGrid='on';
% ax.YMinorTick='on';
% text(60,7,["Mean age: " + floor(mean(agesD)) + " yrs (" + "{\pm}" + floor(std(agesD))+")"],'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic','EdgeColor',[0 0 0],'LineWidth',1,'BackgroundColor',[.8 .8 .8]);
% subplot(223)
% h3=histogram(agesP,'BinWidth',5);
% h3.FaceColor=[255/255	90/255	54/255];
% h3.LineWidth=1;
% ylim([0 12]);
% yticks(0:2:12);
% xticks(0:5:max(agesP));
% title("Ages distribution of pre-diabetic subjects",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
% ylabel("Number of subjects",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% xlabel("Age",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% ax=gca();
% ax.YGrid='on';
% ax.YMinorTick='on';
% text(50,10,["Mean age: " + floor(mean(agesP)) + " yrs (" + "{\pm}" + floor(std(agesP))+")"],'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic','EdgeColor',[0 0 0],'LineWidth',1,'BackgroundColor',[.8 .8 .8]);
% subplot(224)
% h4=histogram(agesH,'BinWidth',5);
% h4.FaceColor=[0/255	86/255	63/255];
% h4.LineWidth=1;
% ylim([0 36]);
% yticks(0:2:36);
% xticks(0:5:max(agesH));
% title("Ages distribution of healthy subjects",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
% ylabel("Number of subjects",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% xlabel("Age",'FontSize',15,'FontWeight','bold','FontName','Adobe Arabic');
% ax=gca();
% ax.YGrid='on';
% ax.YMinorTick='on';
% text(50,30,["Mean age: " + floor(mean(agesH)) + " yrs (" + "{\pm}" + floor(std(agesH))+")"],'FontSize',10,'FontWeight','bold','FontName','Adobe Arabic','EdgeColor',[0 0 0],'LineWidth',1,'BackgroundColor',[.8 .8 .8]);
% 
% %% %% now we want to see the prevalence of ethnicity/type of A1c/race/gender measurement for each class with a pie chart
% %% race
% [allfeat,featD,featP,featH]=getClassesInfo(subjectsWithFeatures,"race");
% allfeat=categorical(allfeat);
% featD=categorical(featD);
% featP=categorical(featP);
% featH=categorical(featH);
% 
% catAll=categories(allfeat);
% catD=categories(featD);
% catP=categories(featP);
% catH=categories(featH);
% 
% countCatsAll=countcats(allfeat);
% countCatsD=countcats(featD);
% countCatsP=countcats(featP);
% countCatsH=countcats(featH);
% 
% %
% figure();
% subplot(221)
% pie3(countCatsAll);
% legend({["% of Asian"],["% of Black"],["% of Decline to Answer"],["% of More than one race"],["% of Other"],["% of White"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     0/255	86/255	63/255; %verde
%     171/255	130/255	255/255 ; %lavender    
%     14/255	47/255	68/255; %blu
%     191/255	255/255	0/255; %lime
%     205/255	127/255	50/255; %arancione
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Race prevalence in all subjects",'FontSize',20,'FontWeight','bold');
% subplot(222)
% pie3(countCatsD);
% legend({["% of Asian"],["% of Black"],["% of Other"],["% of White"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     0/255	86/255	63/255; %verde
%     171/255	130/255	255/255 ; %lavender    
%     205/255	127/255	50/255; %arancione
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Race prevalence in diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(223)
% pie3(countCatsP);
% legend({["% of Black"],["% of White"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender    
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Race prevalence in pre-diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(224)
% pie3(countCatsH);
% legend({["% of Asian"],["% of Black"],["% of Decline to Answer"],["% of More than one race"],["% of White"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     0/255	86/255	63/255; %verde
%     171/255	130/255	255/255 ; %lavender    
%     14/255	47/255	68/255; %blu
%     191/255	255/255	0/255; %lime
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Race prevalence in healthy subjects",'FontSize',20,'FontWeight','bold');
% %% gender
% [allfeat,featD,featP,featH]=getClassesInfo(subjectsWithFeatures,"gender");
% allfeat=categorical(allfeat);
% featD=categorical(featD);
% featP=categorical(featP);
% featH=categorical(featH);
% 
% catAll=categories(allfeat);
% catD=categories(featD);
% catP=categories(featP);
% catH=categories(featH);
% 
% countCatsAll=countcats(allfeat);
% countCatsD=countcats(featD);
% countCatsP=countcats(featP);
% countCatsH=countcats(featH);
% 
% %
% figure();
% subplot(221)
% p=pie3(countCatsAll);
% legend({["% of Female"],["% of Male"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender 
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Gender prevalence in all subjects",'FontSize',20,'FontWeight','bold');
% subplot(222)
% pie3(countCatsD);
% legend({["% of Female"],["% of Male"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender 
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Gender prevalence in diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(223)
% pie3(countCatsP);
% legend({["% of Female"],["% of Male"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender 
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Gender prevalence in pre-diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(224)
% pie3(countCatsH);
% legend({["% of Female"],["% of Male"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     171/255	130/255	255/255 ; %lavender 
%     96/255 130/255 182/255 ; %blu grigietto
%     ];
% ax.Colormap = newColors;
% title("Gender prevalence in healthy subjects",'FontSize',20,'FontWeight','bold');
% %% ethnicity non disponibile
% %% A1C collection method
% [allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,"dataTable.a1Cmethod");
% allfeat=categorical(allfeat);
% featD=categorical(featD);
% featP=categorical(featP);
% featH=categorical(featH);
% 
% catAll=categories(allfeat);
% catD=categories(featD);
% catP=categories(featP);
% catH=categories(featH);
% 
% countCatsAll=countcats(allfeat);
% countCatsD=countcats(featD);
% countCatsP=countcats(featP);
% countCatsH=countcats(featH);
% 
% %
% figure();
% subplot(221)
% pie3(countCatsAll);
% legend({["Laboratory"],["Point Of Care"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     96/255 130/255 182/255 ; %blu grigietto
%     191/255	255/255	0/255; %lime
%     ];
% ax.Colormap = newColors;
% title("A1C collection method prevalence in all subjects",'FontSize',20,'FontWeight','bold');
% subplot(222)
% pie3(countCatsD);
% legend({["Laboratory"],["Point Of Care"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     96/255 130/255 182/255 ; %blu grigietto
%     191/255	255/255	0/255; %lime
%     ];
% ax.Colormap = newColors;
% title("A1C collection method prevalence in diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(223)
% pie3(countCatsP);
% legend({["Laboratory"],["Point Of Care"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     96/255 130/255 182/255 ; %blu grigietto
%     191/255	255/255	0/255; %lime
%     ];
% ax.Colormap = newColors;
% title("A1C collection method prevalence in pre-diabetic subjects",'FontSize',20,'FontWeight','bold');
% subplot(224)
% pie3(countCatsH);
% legend({["Laboratory"],["Point Of Care"]},'FontSize',10,'LineWidth',1);
% ax=gca();
% newColors=[
%     96/255 130/255 182/255 ; %blu grigietto
%     191/255	255/255	0/255; %lime
%     ];
% ax.Colormap = newColors;
% title("A1C collection method prevalence in healthy subjects",'FontSize',20,'FontWeight','bold');
%% boxplots of the features in the three classes
featuresBoxPlots(subjectsWithFeatures);
%% -------------------end of statistical analysis--------------------------
%%
