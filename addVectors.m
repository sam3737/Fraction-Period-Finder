%n=fullNumber(28,29,"fraction")
%addVectors(n.period(length(n.period)/2+1:end), n.period(1:length(n.period)/2))
function sum = addVectors(vec1, vec2)
    n = length(vec1);
    sum = zeros(1, n);
    carry = 0;
    
    for i = n:-1:1
        x = vec1(i) + vec2(i) + carry;
        sum(i) = mod(x, 10);
        carry = floor(x / 10);
    end
    
    if carry > 0
        sum = [carry, sum];
    end
end