% generateData - Calculate denominators and their periods.
%
% Syntax:
%   [denominators, periods] = generateData(maxDenominator, findPeriodFunction, saveData)
%
% Inputs:
%   maxDenominator - Maximum denominator to calculate periods up to.
%   findPeriodFunction - Function handle to find the period (use @).
%   saveData - Boolean flag to save data in data.mat.
%
% Outputs:
%   denominators - Array of denominators.
%   periods - Array of corresponding periods.

function [denominators, periods] = generateData(maxDenominator, findPeriodFunction, saveData)

    % default save to false
    if ~exist('saveData','var')
        saveData = false;
    end

    % intialize arrays
    denominators = zeros(1, maxDenominator);
    periods = zeros(1, maxDenominator);
    counter = 0;
    
    % do for every denominator
    for x = 1:maxDenominator
        
        % get the period
        period = findPeriodFunction(x);

        % if repeating, store the data
        if period ~= -1
            counter = counter + 1;
            denominators(counter) = x;
            periods(counter) = period;
        end

        if saveData && mod(x,1000) == 0
            save('data.mat', 'denominators', 'periods');
            disp("Saving data at denominator = " + x);
        end
    end
    
    % Trim excess zeros if needed
    denominators = denominators(1:counter);
    periods = periods(1:counter);

    % if save is true, save in a .mat file
    if saveData
        save('dataFiles/data.mat', 'denominators', 'periods');
    end
end
