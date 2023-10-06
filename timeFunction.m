
function time = timeFunction(findPeriodFunction, maxDenominator, iterations)
    time=0;   
    for i=1:iterations
        tic; generateData(maxDenominator, findPeriodFunction, false); time=time+toc;
    end
    time = time/iterations;
end