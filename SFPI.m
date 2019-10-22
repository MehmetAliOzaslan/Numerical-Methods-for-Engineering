function result = SFPI(g, initialValue, tolerance)
Error = inf;
xold = initialValue;
i = 1;
fprintf('%s  %s\t\t%s \n', 'Counter', '    Roots', 'Relative Error(%)')

while Error > tolerance
    xnew = g(xold);
    Error = abs(xnew-xold)*100;
    xold = xnew;
    fprintf('   %i \t   %f        %f \n', i, xnew, Error)
    i = i + 1;
end
result = double(xnew);
end
