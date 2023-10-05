# Fraction-Period-Finder
Gets a user input and finds the period of a simplified fraction with that denominator.

## Files

### findPeriod.m

`findPeriod(denominator, max)`

Returns the period of a simplified fraction which has the denominator `denominator`. The argument `max` is the largest period which the algorithm will check.

It does this by uising the property that if `mod(10^m, n) == 1` for the smallest possible whole m, then a simplified fraction with denominator n has the period m. Additionally, if `mod(10^m, n) == n-1`, the period is 2i.

### simplifyFraction.m

`simplifyFraction(numerator, denominator)`

Returns the simplified equivilant of a fraction with some numerator and denominator in the form `[numerator, denominator]`.

### generateData.m

`generateData(maxDenominator, saveData)`

Returns two parallel arrays of denominators and their asssociated periods in the range `1:maxDenominator`. If `saveData` is true, the variables `denominators` and `periods` will be saved in the file `data.mat`.

### everyFraction.m

`everyFraction(len, saveData)`

Returns an array of length `len` of every simplified fraction, starting with the smallest numerator and denominator. For example, it will start `1, 1/2, 1/3, 2/3, 1/4, 3/4...` If `saveData` is true, it will save the variable `fractions` to `everyFraction.mat`.

### removeEquation

`removeEquation(saveData)`

Removes points from the denominator/period set described by `period == ceil(denominator*fraction)-1` for every fraction in `everyFraction.mat`. Returns the parallel arrays `fractions` and `numRemoved` which contain the fractions and associated number of points removed, sorted in descending order as well as the new set of denominators and periods with points removed. If `saveData` is true, the variables `fractions`, `numRemoved`, `culledDenominators`, and `culledPeriods` in the file `equationData.mat`.
