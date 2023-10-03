% generate a list of fractions of length len
function out = everyFraction(len, saveData)

    % default save to false
    if ~exist('saveData','var')
        saveData = false;
    end

    % initialize output array
    out = zeros(1,len);
    out(1) = 1;
    counter = 2;

    % first fraction is 1/2
    numerator = 1;
    denominator = 2;

    while counter <= len

        % if fraction is simplified, add it to out
        if (isequal([numerator, denominator], simplifyFraction(numerator, denominator)))
            out(counter) = numerator/denominator;
            counter = counter + 1;
        end

        % iterate fraction
        if (numerator + 1 == denominator)
            numerator = 1;
            denominator = denominator + 1;
        else
            numerator = numerator + 1;
        end
    end

    % if save is true, save in a .mat file
    if saveData
        fractions = out;
        save('everyFraction.mat', 'fractions');
    end
end
