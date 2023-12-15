function [base, period] = fractionToDecimal(numerator, denominator)

    [numerator, denominator] = simplifyFraction(numerator, denominator);
    [periodLength, maxDiv] = clmFindPeriod(denominator);
    decimalExpansion = nLengthDivision(numerator, denominator, 1 + maxDiv + periodLength);
    base = decimalExpansion(1:1+maxDiv);
    period = decimalExpansion(2+maxDiv:end);

end