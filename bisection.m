function xr = bisection(f, xlower, xupper, tolerance)
if(f(xlower) == 0);xr = xlower; return; end
if(f(xupper) == 0);xr = xupper; return; end
if(f(xlower)*f(xupper))>0; disp('No fond root'); return; end

Error = inf;
counter = 1;
fprintf('%s   %s  %s %s %s\n', 'Terms', '    Xlower', '   Xupper', '   Roots', '   Relative Error(%)')

while Error > tolerance
    xmiddle = (xlower+xupper)/2;
    fprintf('  %1.0f   \t   %8.6f   %8.6f  %8.6f  %8.6f \n', ...
        counter, f(xlower), f(xupper), xmiddle, Error)
    if(f(xmiddle) == 0);xr = xmiddle; return; end
    if(f(xlower)*f(xmiddle))<0
        xupper = xmiddle;
    elseif(f(xlower)*f(xmiddle))>0
        xlower = xmiddle;
    end
    Error = abs(double(xupper-xlower))*100;
    counter = counter + 1;
end
xr = xmiddle;
end