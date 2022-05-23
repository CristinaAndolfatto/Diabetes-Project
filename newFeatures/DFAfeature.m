function [DFA] = DFAfeature(subject,day)

    timeTable = subject.timeTableImputed;
    
    TR = timerange(day,"days");
    dayTimeTable = timeTable(TR,:);
    dayGlucoseProfile = dayTimeTable.glucose;

    %% Equally distributed windows from 24h to 15'
    numberOfElements = numel(dayGlucoseProfile);
    K=1:numberOfElements;
    D = K(rem(numberOfElements,K)==0); % divisors of numberOfElements
    
    windows = {};
    for i=D(1:length(D)-2) % to exclude windows of 10' and 5'
        timeWindowSize = numberOfElements/i; % block size
        temp = mat2cell(dayGlucoseProfile,diff([0:timeWindowSize:numberOfElements-1,numberOfElements]));
        windows = [windows;temp];
    end

    %% Linear regression on each window
    linearRegression = cell(length(windows),1);
    time = cell(length(windows),1);
    
    for i=1:length(windows)
        window = windows{i,1}; 
        t = (0:1:length(windows{i,1})-1);
        coeff = polyfit(t,window,1);
        line = polyval(coeff,t); 
        linearRegression{i,1} = line';
        time {i,1} = t;
    end 

    %% Fn
    tempFn = zeros(length(windows),1);
    for i=1:length(windows)
        tempFn(i) = sqrt((sum((linearRegression{i,1} - windows{i,1}).^2))./numberOfElements);
    end 
    
    Fn = zeros(length(D)-2,1); 
    pos = 0;
    for i=D(3:end) % all different time windows lenghts
        pos = pos +1; 
        for j=1:length(windows) % Fn values corresponding at equal size windows have to be summed
            if length(windows{j,1}) == i
                Fn(pos) = Fn(pos)+tempFn(j); 
            end 
        end
    end 

    %% DFA feature
    n = zeros(length(windows),1);
    for i=1:length(windows)
        n(i) = length(windows{i,1});
    end 
    n = unique(n);
    
    logFn = log(Fn); logn = log(n);
    
    DFA = polyfit(logn,logFn,1);
    DFA = DFA(1); 

end % function