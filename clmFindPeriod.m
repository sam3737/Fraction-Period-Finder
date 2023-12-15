% find the length of a period of a simplified fraction with some
% denominator using consecutiveLogMod
function [periodLength, baseOffset] = clmFindPeriod(denominator, maxPeriod)

    % default max to infinity
    if ~exist('max','var')
        maxPeriod = inf;
    end

    % if denominator is 0, return infity
    if denominator == 0
        periodLength = inf;
        baseOffset = 0;
        return
    end

    % make denominator positive
    denominator = abs(denominator);

    % turn decimals whole
    while mod(denominator, 1) ~= 0
        denominator = denominator * 10;
    end

    % divide evenly by 2 until impossible
    twoDivs = 0;
    while mod(denominator,2) == 0
        denominator = denominator / 2;
        twoDivs = twoDivs + 1;
    end

    % divide evenly by 5 until impossible
    fiveDivs = 0;
    while mod(denominator,5) == 0
        denominator = denominator / 5;
        fiveDivs = fiveDivs + 1;
    end
    baseOffset = max(twoDivs, fiveDivs);

    % if denomiator falls to 1, return nonrepeating
    if denominator == 1
        periodLength = 0;
    else

        i=1;

        % calculate the indicator
        logModiDenom = logMod(i, denominator);

        % if mod(10^i, denominator) is 1, i is the period
        if logModiDenom == 1 
            periodLength = i;
            return
        % if mod(10^i, denominator) is d-1, 2*i is the period
        elseif  logModiDenom == denominator-1
            periodLength = 2*i;
            return
        end

        i = i+1;

        while true
            
            % calculate the indicator
            logModiDenom = consecutiveLogMod(i, denominator, i-1, logModiDenom);

            % if mod(10^i, denominator) is 1, i is the period
            if logModiDenom == 1 
                periodLength = i;
                return
            % if mod(10^i, denominator) is d-1, 2*i is the period
            elseif  logModiDenom == denominator-1
                periodLength = 2*i;
                return
            end

            i = i+1;
        end
    end
end