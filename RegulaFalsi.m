function result = RegulaFalsi(f, xlower, xupper, tolerance)
if(f(xlower) == 0);result = xlower; return; end
if(f(xupper) == 0);result = xupper; return; end
if(f(xlower)*f(xupper))>0; disp('Root not found'); return; end

Error = inf;
counter = 1;
fprintf('%s   %s  %s %s %s\n', 'Terms', '    Xlower', '   Xupper', '   Roots', '   Relative Error(%)')

while Error > tolerance
    xmiddle = xupper - f(xupper)*(xlower-xupper)/(f(xlower)-f(xupper));
    fprintf('  %1.0f   \t   %8.6f   %8.6f  %8.6f  %8.6f \n', ...
        counter, f(xlower), f(xupper), xmiddle, Error);
    if(f(xmiddle) == 0);result = xmiddle; return; end
    if(f(xlower)*f(xmiddle))<0
        xupper = xmiddle;
    elseif(f(xlower)*f(xmiddle))>0
        xlower = xmiddle;
    end
    Error = abs(double(xupper-xlower))*100;
    counter = counter + 1;
end
result = xmiddle;
end