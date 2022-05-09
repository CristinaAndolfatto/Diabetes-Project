function featuresBoxPlots(subjectsWithFeatures)
%% this function plots the boxplots with the features of the three classes
%% glucose mean
feature="features.variability.meanGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Subjects glucose mean",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% glucose mean daily
feature="features.daytimeAnalysis.day.variability.meanGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Subjects glucose mean (daily data)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% glucose mean night
feature="features.daytimeAnalysis.night.variability.meanGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Subjects glucose mean (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% median glucose
feature="features.variability.medianGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Median glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Median glucose",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off

%% median glucose day
feature="features.daytimeAnalysis.day.variability.medianGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Median glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Median glucose (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% median glucose night
feature="features.daytimeAnalysis.night.variability.medianGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Median glucose (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Median glucose (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% sd glucose
feature="features.variability.stdGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose SD (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose SD",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% sd glucose day
feature="features.daytimeAnalysis.day.variability.stdGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose SD (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose SD (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% sd glucose night
feature="features.daytimeAnalysis.night.variability.stdGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose SD (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose SD (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% cv glucose
feature="features.variability.cvGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose CV (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose CV",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% cv glucose day
feature="features.daytimeAnalysis.day.variability.cvGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose CV (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose CV (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% cv glucose night
feature="features.daytimeAnalysis.night.variability.cvGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose CV (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose CV (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mage index
feature="features.variability.mageIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("MAGE index (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean Amplitude of Glycemic Excursion",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mage index day
feature="features.daytimeAnalysis.day.variability.mageIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("MAGE index (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean Amplitude of Glycemic Excursion (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mage index night
feature="features.daytimeAnalysis.night.variability.mageIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("MAGE index (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean Amplitude of Glycemic Excursion (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% glucose range
feature="features.variability.rangeGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose range (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose range",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% glucose range day
feature="features.daytimeAnalysis.day.variability.rangeGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose range (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose range (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% glucose range night
feature="features.daytimeAnalysis.night.variability.rangeGlucose";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Glucose range (mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Glucose range (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% ef index
feature="features.variability.efIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("EF index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("EF index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% ef index day
feature="features.daytimeAnalysis.day.variability.efIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("EF index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("EF index (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% ef index night
feature="features.daytimeAnalysis.night.variability.efIndex";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("EF index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("EF index (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in target
feature="features.time.timeInTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in target",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in target day
feature="features.daytimeAnalysis.day.time.timeInTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in target (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in target night
feature="features.daytimeAnalysis.night.time.timeInTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in target (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in tigh target
feature="features.time.timeInTightTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in tight target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in tight target (90-140 mg/dl)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in tight target day
feature="features.daytimeAnalysis.day.time.timeInTightTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in tight target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in tight target (90-140 mg/dl) (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time in tight target night
feature="features.daytimeAnalysis.night.time.timeInTightTarget";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in tight target (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in tight target (90-140 mg/dl) (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hyperglycemia
feature="features.time.timeInHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hyperglycemia",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hyperglycemia day
feature="features.daytimeAnalysis.day.time.timeInHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hyperglycemia (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hyperglycemia night
feature="features.daytimeAnalysis.night.time.timeInHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hyperglycemia (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hyper
feature="features.time.timeInSevereHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hyperglycemia",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hyper day
feature="features.daytimeAnalysis.day.time.timeInSevereHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hyperglycemia (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hyper night
feature="features.daytimeAnalysis.night.time.timeInSevereHyperglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hyperglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hyperglycemia (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hypo
feature="features.time.timeInHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hypoglycemia",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hypo day
feature="features.daytimeAnalysis.day.time.timeInHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hypoglycemia (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time hypo night
feature="features.daytimeAnalysis.night.time.timeInHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in hypoglycemia (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hypo
feature="features.time.timeInSevereHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hypoglycemia",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hypo day
feature="features.daytimeAnalysis.day.time.timeInSevereHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hypoglycemia (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% time severe hypo night
feature="features.daytimeAnalysis.night.time.timeInSevereHypoglycemia";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Time in severe hypoglycemia (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Time in severe hypoglycemia (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% GMI
feature="features.variability.gmi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("GMI (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("GMI (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hyper
feature="features.event.hyperglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hyperglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hyperglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hyper day
feature="features.daytimeAnalysis.day.event.hyperglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hyperglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hyperglycemic events per week (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hyper night
feature="features.daytimeAnalysis.night.event.hyperglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hyperglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hyperglycemic events per week (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hypo 
feature="features.event.hypoglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hypoglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hypoglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hypo day
feature="features.daytimeAnalysis.day.event.hypoglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hypoglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hypoglycemic events per week (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% mean number hypo night
feature="features.daytimeAnalysis.night.event.hypoglycemicEventsPerWeek";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Mean number of hypoglycemic events per week",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Mean number of hypoglycemic events per week (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% hbgi
feature="features.risk.hbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("HBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("HBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% hbgi day
feature="features.daytimeAnalysis.day.risk.hbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("HBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("HBGI index (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% hbgi night
feature="features.daytimeAnalysis.night.risk.hbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("HBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("HBGI index (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% lbgi 
feature="features.risk.lbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("LBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("LBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% lbgi day
feature="features.daytimeAnalysis.day.risk.lbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("LBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("LBGI index (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% lbgi night
feature="features.daytimeAnalysis.night.risk.lbgi";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("LBGI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("LBGI index (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% bgri
feature="features.risk.bgri";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("BGRI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("BGRI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% bgri day
feature="features.daytimeAnalysis.day.risk.bgri";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("BGRI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("BGRI index (day)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% bgri night
feature="features.daytimeAnalysis.night.risk.bgri";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("BGRI index",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("BGRI index (night)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% age
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,"age");
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("Age (years)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Age",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% A1c
feature="features.variability.meanHbA1c";
[allfeat,featD,featP,featH]=getClassesFeatures(subjectsWithFeatures,feature);
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("A1c (%)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("A1c level",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
%% BMI
featureWT="wt";
[allfeatWT,featDWT,featPWT,featHWT]=getClassesFeatures(subjectsWithFeatures,featureWT);
featureHT="ht";
[allfeatHT,featDHT,featPHT,featHHT]=getClassesFeatures(subjectsWithFeatures,featureHT);
allfeatHT=(allfeatHT./100).^2;
featDHT=(featDHT./100).^2;
featPHT=(featPHT./100).^2;
featHHT=(featHHT./100).^2;
allfeat=allfeatWT./allfeatHT;
featD=featDWT./featDHT;
featP=featPWT./featPHT;
featH=featHWT./featHHT;
numNaND=length(allfeat)-length(featD);
numNaNP=length(allfeat)-length(featP);
numNaNH=length(allfeat)-length(featH);
featD=[featD;NaN(numNaND,1)];
featP=[featP;NaN(numNaNP,1)];
featH=[featH;NaN(numNaNH,1)];
boxplots_features=[allfeat featH featP featD];
boxFaceColor=[
    96/255 130/255 182/255 ; %blu grigietto
    0/255	86/255	63/255; %healthy
    255/255	156/255	54/255; % prediabetics
    153/255	0/255	0/255; %diabetics
    ];
x=1:4;
figure();
hold on
for idx=1:4
box=boxchart(x(idx)*ones(size(boxplots_features(:,idx))),boxplots_features(:,idx),'BoxFaceColor',boxFaceColor(idx,:),'MarkerColor',boxFaceColor(idx,:));
box.LineWidth=1.5;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
ylabel("BMI (kg/m^2)",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
title("Subjects BMI",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
set(gca,'YGrid','on');
set(gca,'YMinorGrid','on');
xticks([1:4]);
xticklabels(categorical(["All subjects","Healthy","Prediabetic","Diabetic"]));
ax=gca();
ax.XAxis.FontSize=15;
xlabel("Subjects type",'FontSize',20,'FontWeight','bold','FontName','Adobe Arabic');
end
hold off
end