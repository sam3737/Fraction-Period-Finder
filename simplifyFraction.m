% simply a fraction
function out = simplifyFraction(numerator, denominator)

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