% Simpliy a fraction
function [numerator, denominator] = simplifyFraction(numerator, denominator)

    % Get the sign of the fraction
    positive = (numerator * denominator > 0);

    % Take absolute values
    numerator = abs(numerator);
    denominator = abs(denominator);

    % Find the greatest common divisor (GCD) using Euclidean algorithm
    gcd_val = gcd(numerator, denominator);

    % Simplify the fraction
    numerator = numerator / gcd_val;
    denominator = denominator / gcd_val;

    % Apply negative if necessary
    if ~positive
        numerator = -numerator;
    end

end
