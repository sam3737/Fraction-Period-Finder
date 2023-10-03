%{
Fraction Period Finder
Sam McDowell
Updated 12/19/22
%}

%{
numerator = input("Fraction numerator: ");
denominator = input("Fraction denominator: ");
fraction = simplify(numerator, denominator);

disp("Simplified fraction: " + fraction(1) + "/" + fraction(2))
disp("Period: " + findPeriod(fraction(2)))
%}

warning('off')
hold on
clf

figure(1)

maxIter = 10000;
times = zeros(1,maxIter);
for x = 1:maxIter
    tic; period =  findPeriod(x); time=toc;
    times(x)=time;
    if period ~= 'nonrepeating'
        plot(x, period, 'ok','MarkerSize',1)
    end
end

figure(2)
plot(times,'ok','MarkerSize',1)

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

% find the period of a simplified fraction from a denominator
function out = findPeriod(denominator, max)

    % default max to infinity
    if ~exist('max','var')
        max = inf;
    end

    % if denominator is 0, return infity
    if denominator == 0
        out = "infinity";
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
        out = "nonrepeating";
    else
        for i=1:max
            % if mod(10^i, denominator) is 1, i is the period
            if logMod(i, denominator) == 1 
                out = i;
                return
            % if mod(10^i, denominator) is d-1, 2*i is the period
            elseif  logMod(i, denominator) == denominator-1
                out = 2*i;
                return
            end
        end
    end
end

% simply a fraction
function out = simplify(numerator, denominator)

    % if the whole fraction is positive or negative
    if numerator * denominator > 0
        positive = true;
    else
        positive = false;
    end

    % set both to positive
    numerator = abs(numerator);
    denominator = abs(denominator);

    % change to whole numbers
    while mod(numerator,1) ~= 0 || mod(denominator,1) ~= 0
        numerator = numerator * 10;
        denominator = denominator * 10;
    end

    % simplify
    for i = numerator:-1:2
        if mod(numerator, i) == 0 && mod(denominator, i) == 0
            numerator = numerator/i;
            denominator = denominator/i;
        end
    end

    % apply negative is necessary
    if positive == false
        numerator = numerator * -1;
    end

    out = [numerator, denominator];
end
