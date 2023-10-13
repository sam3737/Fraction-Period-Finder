
GENERATE_DATA = false;
GENERATE_FRACTIONS = false;
GENERATE_EQ_DATA = false;

DATA_MAX_DENOMINATOR = 10000;
FRACTIONS_LENGTH = 100000;
RECIPROCAL_FRACTIONS_ONLY = false;
PERIOD_ALGORITHM = @optimizedFindPeriod;

if GENERATE_DATA
    disp("Generating data")
    generateData(DATA_MAX_DENOMINATOR, PERIOD_ALGORITHM, true);
end
disp("Loading data")
load dataFiles/data.mat;


if GENERATE_FRACTIONS
    if ~RECIPROCAL_FRACTIONS_ONLY
        disp("Generating fractions")
        everyFraction(FRACTIONS_LENGTH, true);
    else
        fractions = (1:FRACTIONS_LENGTH).^-1;
        save("dataFiles/fractions.mat", "fractions")
    end
end
disp("Loading fractions")
load dataFiles/everyFraction.mat;

if GENERATE_EQ_DATA
    disp("Generatig equation data")
    removeEquation(true);
end
disp("Loading equation data")
load dataFiles/equationData.mat;


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

relevantNumRemoved = numRemoved(1:find(numRemoved == 0, 1, 'first')-1);
relevantFractions = fractions(1:length(numRemoved));
