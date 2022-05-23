function[suitableDaysFinal] = daySelection (subject)
    
    timeTable = subject.timeTableImputed;
    days = timeTable.Time;

    suitableDays = cell(length(days),1);
    for i=1:length(days)
        day = datestr(days(i),'yyyy-mm-dd');
        suitableDays{i,1} = day;
    end 
    suitableDays = unique(suitableDays);

    % Delete day 1 and last day because not complete
    suitableDays = suitableDays(2:end-1);
    
    % Delete day 1, day 2 and last day
    % suitableDays = suitableDays(3:end-1);

    % Delete days with more than 4 consecutive NaN 
    suitableDaysFinal = {};
    for i = 1: length(suitableDays)
      dateAsString = suitableDays{i,1};
      TR = timerange(dateAsString,"days");
      dayTimeTable = timeTable(TR,:);
      dayGlucoseProfile = dayTimeTable.glucose;
      if sum(isnan(dayGlucoseProfile))==0
          suitableDaysFinal = [suitableDaysFinal;suitableDays(i)];
      end 
    end 

end %function


