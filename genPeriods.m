noPeriod = [];
oddPeriod = [];
evenNoPattern = [];
pattern = [];
figure()
hold on
for i=2:1000
    n = fullNumber(1,i,"fraction");
    if isempty(n.period)
        noPeriod = [noPeriod, i];
        scatter(i,1)
    elseif mod(length(n.period),2) ~= 0
        oddPeriod = [oddPeriod, i];
        scatter(i,2)
    elseif all(addVectors(n.period(length(n.period)/2+1:end), n.period(1:length(n.period)/2))==9)
        pattern = [pattern, i];
        scatter(i,3)
    else
        evenNoPattern = [evenNoPattern,i];
        scatter(i,4)
    end
end