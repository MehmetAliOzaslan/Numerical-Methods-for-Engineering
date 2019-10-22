function GaussJordan(A,B,E)
disp('Solution is coming...');
for i = 3:-1:1
    disp(i);pause(0.9);
end
[m,n] = size(A);
if m ~= n;disp('Coefficient matrix must be square matrix');return;end
k = length(B);if k ~= m;disp('The number of elements of the constants vector is incompatible with the coefficient matrix'); return; end
[~,b] = size(B);if b ~= 1; B = B';end
if det(A) == 0; disp('The determinant of the coefficient matrix is zero. Cannot find solution');return;end
C = [A B];
if size(E,1) ~= m;disp('Constants vector is not compatible with coefficient matrix');return;end

for j = 1:m-1
    for i = j+1:m
        C(i,:) = C(j,:)*(-C(i,j)/C(j,j)) + C(i,:);        
    end
end
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%s \n','         Inverse of a matrix by GAUSSIAN - JORDAN method (All System)')
for j = m:-1:1
    for i = j-1:-1:1
        C(i,:) = (C(j,:)*(-C(i,j)/C(j,j)) + C(i,:))/(C(i,i));  
    end 
    C(m,m:end) = C(m,m:end) / C(m,m);
end
disp(C)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%s \n','         Inverse of a matrix by GAUSSIAN - JORDAN method')
for j = m:-1:1
    for i = j-1:-1:1
        D = C(:,(m+1):end);
    end 
end
disp(D)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%s \n','     Roots')
RES = zeros(m,1);

for i = 1:m
    for k = 1:m
        RES(i,1) = RES(i,1) + D(i,k).*E(k,1);
    end 
end
disp(RES)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
end