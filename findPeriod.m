%{
Fraction Period Finder
Sam McDowell
Updated 10/3/23
%}

% find the period of a simplified fraction from a denominator
function out = findPeriod(denominator, max)

    % default max to infinity
    if ~exist('max','var')
        max = inf;
    end

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
        for i=1:max
            
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

% solve mod(10^a, b) for high "a" values
function out = logMod(a,b)

    maxExponent=22; % largest exponent MATLAB can use

    % starting values
    count=0;
    total = 1;
    
    % employ mod(a*b, c) = mod(mod(a, c) * mod(b, c), c) for c > a & c > b
    while true

        % if coun't wouldn't surpass a
        if count + maxExponent < a
            total = mod(total * mod(10^maxExponent, b), b);
            count = count + maxExponent;
        else
            total = mod(total * mod(10^(a - count), b), b);
            break
        end
    end
    out = total;
end
