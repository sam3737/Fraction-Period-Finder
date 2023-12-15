function out = nLengthDivision(numerator, denominator, n)
    out = zeros(1, n);
    for i = 1:n
        x = floor(numerator / denominator);
        out(i) = x;
        if x ~= 0
            numerator = rem(numerator, denominator);
        end
        numerator = numerator * 10;
    end
end
