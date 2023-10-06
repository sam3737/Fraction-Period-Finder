%{
Fraction Guess Find Period
Sam McDowell
Updated 10/3/23
%}

% find the period of a simplified fraction from a denominator
function out = fgFindPeriod(denominator)

    % if denominator is 0, return infity
    if denominator == 0
        out = inf;
        return
    end

    % make denominator positive
    denominator = abs(denominator);

    % turn decimals whole
    while mod(denominator, 1) ~= 0
        denominator = denominator * 10;
    end

    % divide evenly by 2 until impossible
    while mod(denominator,2) == 0
        denominator = denominator / 2;
    end

    % divide evenly by 5 until impossible
    while mod(denominator,5) == 0
        denominator = denominator / 5;
    end

    % if denomiator falls to 1, return nonrepeating
    if denominator == 1
        out = -1;
    else
        toTry = sort(unique(ceil(((1:500).^-1)*denominator)-1));
        toTry = toTry(toTry>0);
        for i=toTry
            % calculate the indicator
            logModiDenom = logMod(i, denominator);

            % if mod(10^i, denominator) is 1, i is the period
            if logModiDenom == 1 
                out = i;
                return
            % if mod(10^i, denominator) is d-1, 2*i is the period
            elseif  logModiDenom == denominator-1
                out = 2*i;
                return
            end
        end
        for i=1:denominator

            % calculate the indicator
            logModiDenom = logMod(i, denominator);

            % if mod(10^i, denominator) is 1, i is the period
            if logModiDenom == 1
                out = i;
                return
                % if mod(10^i, denominator) is d-1, 2*i is the period
            elseif  logModiDenom == denominator-1
                out = 2*i;
                return
            end

        end
    end
end
