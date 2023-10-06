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