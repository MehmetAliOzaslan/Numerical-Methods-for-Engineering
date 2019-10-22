function res = Secant(f, initialValue1, initialValue2, tolerance)
x(1) = initialValue1;
x(2) = initialValue2;
Error = inf;
i = 2;

while Error > tolerance
    x(i+1) = x(i) - (f(x(i)))*((x(i) - x(i-1)) / (f(x(i)) - f(x(i-1))));
    Error = abs(x(i) - x(i-1));
    i = i + 1;
end
res = x(i);
end