function plotLinEq(m,b,min,max)
    x = linspace(min, max, max-min+1);
    y = ceil(m * x) + b;
    plot(x,y)
end