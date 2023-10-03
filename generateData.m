
function [denominators, periods] = generateData(maxDenominator, saveData)

    % default save to false
    if ~exist('saveData','var')
        saveData = false;
    end

    % intialize arrays
    denominators = zeros(1, maxDenominator);
    periods = zeros(1, maxDenominator);
    counter = 0;
    
    for x = 1:maxDenominator
        period = findPeriod(x);
        if period ~= -1
            counter = counter + 1;
            denominators(counter) = x;
            periods(counter) = period;
        end
    end
    
    % Trim excess zeros if needed
    denominators = denominators(1:counter);
    periods = periods(1:counter);
    
    figure(1)
    title('Denominator vs. Period')
    xlabel('Denominator')
    ylabel('Period')
    scatter(denominators, periods, 2, 'ok')

    % if save is true, save in a .mat file
    if saveData
        save('data.mat', 'denominators', 'periods');
    end
end
