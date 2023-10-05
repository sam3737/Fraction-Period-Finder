
GENERATE_DATA = false;
GENERATE_FRACTIONS = false;
GENERATE_EQ_DATA = false;

DATA_MAX_DENOMINATOR = 10000;
FRACTIONS_LENGTH = 100000;

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

figure(3)
hold on
title('Culled Denominator vs. Culled Period')
xlabel('Denominator')
ylabel('Period')
scatter(culledDenominators, culledPeriods, 2, 'ok')

numRemoved = numRemoved(1:find(numRemoved == 0, 1, 'first')-1);
fractions = fractions(1:length(numRemoved));
