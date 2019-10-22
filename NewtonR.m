function NewtonR(f,ft,xb,tolerance)
xold = xb;
Error = inf;
counter = 1;
fprintf('%s %s      %s \t      %s \n', 'counter', 'xold', 'xnew', 'error')

while Error > tolerance
    xnew = xold - f(xold) / ft(xold);
    Error = abs(xnew - xold);
    fprintf('%i \t %6.4f \t %6.4f \t %f \n', counter, xold, xnew, Error)
    xold = xnew;
    counter = counter + 1;
end
end
