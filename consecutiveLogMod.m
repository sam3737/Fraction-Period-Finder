% solve logMod(a,b) more efficiently using previous calculations
function out = consecutiveLogMod(a, b, prevA, prevOut)
    out = mod(logMod(a-prevA, b) * prevOut, b);