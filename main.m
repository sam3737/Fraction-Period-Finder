
GENERATE_DATA = true;
GENERATE_FRACTIONS = true;
GENERATE_EQ_DATA = true;

DATA_MAX_DENOMINATOR = 10000;
FRACTIONS_LENGTH = 10000;

if GENERATE_DATA
    disp("Generating data")
    generateData(DATA_MAX_DENOMINATOR, true);
end
disp("Loading data")
load data.mat;


if GENERATE_FRACTIONS
    disp("Generating fractions")
    everyFraction(FRACTIONS_LENGTH, true);
end
disp("Loading fractions")
load everyFraction.mat;


if GENERATE_EQ_DATA
    disp("Generatig equation data")
    removeEquation(true);
end
disp("Loading equation data")
load equationData.mat;


figure(1)
hold on
title('Denominator vs. Period')
xlabel('Denominator')
ylabel('Period')
scatter(denominators, periods, 2, 'ok')


figure(2)
hold on
title('Fraction vs. Frequency')
xlabel('Fraction')
ylabel('Frequency')
bar(fractions(1:20), numRemoved(1:20))