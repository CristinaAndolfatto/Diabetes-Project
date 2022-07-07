function[suitableOverlappingDays] = daySelection2 (subject)

    timeTable = subject.timeTableImputed;
    completeGlucoseProfile = timeTable.glucose;

    % Overlapping windows of 288 samples (overlap = 6 = half an hour) starting from the beginning
    l = length(completeGlucoseProfile);
    overlap = 6;
    overlappingDays = {}; % dovrebbe essere lunga x dove x è tale che fix(l/x) == 6
    extreme1 = 1; extreme2 = 288; i = 1;
    while(extreme2<=l)
        overlappingDays{i,1} = completeGlucoseProfile(extreme1:extreme2);
        extreme1 = extreme1+overlap; extreme2 = extreme2+overlap;
        i = i + 1; 
    end
    
    % Suitable profiles with 0 NaN
    suitableOverlappingDays = {};
    for i = 1:length(overlappingDays)
      currentProfile = overlappingDays{i,1};
      if sum(isnan(currentProfile))==0
          suitableOverlappingDays = [suitableOverlappingDays;currentProfile];
      end 
    end 

    % Adding the last 288 values if with 0 NaN
    lastProfile = completeGlucoseProfile(end-287:end); 
    if sum(isnan(lastProfile))==0
        suitableOverlappingDays = [suitableOverlappingDays;lastProfile];
    end 

end 