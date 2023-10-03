
function [fractions, numRemoved] = removeEquation(saveData)

    % default save to false
    if ~exist('saveData','var')
        saveData = false;
    end

    % load variables
    load data.mat denominators periods
    load everyFraction.mat fractions
    
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
    fractions = sortedFractions;
    numRemoved = sortedNumRemoved;
    
    % if save is true, save in a .mat file
    if saveData
        save('equationData.mat', 'fractions', 'numRemoved');
    end
end
