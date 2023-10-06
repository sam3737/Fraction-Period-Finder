
function [fractions, numRemoved, denominators, periods] = removeEquation(saveData)

    % default save to false
    if ~exist('saveData','var')
        saveData = false;
    end

    % load variables
    load dataFiles/data.mat denominators periods
    load dataFiles/fractions.mat fractions
    
    % intialize output
    numRemoved = zeros(1,length(fractions));

    for fractionIndex = 1:length(fractions)
        initialLength = length(denominators);
        for i = length(denominators):-1:1
            x = denominators(i);
            y = periods(i);
            if y == ceil(x*fractions(fractionIndex))-1
                denominators(i) = [];
                periods(i) = [];
            end
        end
        numRemoved(fractionIndex) = initialLength - length(denominators);
    end
    
    % parallel sort numRemoved and fractions
    [sortedNumRemoved, sortIndex] = sort(numRemoved, 'descend');
    sortedFractions = fractions(sortIndex);
    removeFractions = sortedFractions;
    numRemoved = sortedNumRemoved;
    
    culledDenominators = denominators;
    culledPeriods = periods;

    % if save is true, save in a .mat file
    if saveData
        save('dataFiles/equationData.mat', 'removeFractions', 'numRemoved', 'culledDenominators', 'culledPeriods');
    end
end
