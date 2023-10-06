function out = countEquationFrequency()
    load dataFiles/data.mat denominators periods
    load dataFiles/fractions.mat fractions

    out = zeros(1,length(fractions));
    for i = 1:length(fractions)
        out(i) = sum(checkEquation(denominators, periods, fractions(i), -1));
    end
end

%{
figure;
hold on;
title("Fractions vs. Equation Hits")
xlabel("Fractions")
ylabel("Equation Hits")
loglog(fractions, countEquationFrequency())
%}
