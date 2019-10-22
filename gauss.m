function x = gauss(A,B)
% A : Coefficient matrix, B: column vector
[m,n] = size(A);
if m ~= n;disp('Coefficient matrix must be square matrix');return;end
k = length(B);if k ~= m;disp('The number of elements of the constants vector is incompatible with the coefficient matrix'); return; end
[~,b] = size(B);if b ~= 1; B = B';end
if det(A) == 0; disp('The determinant of the coefficient matrix is zero. Cannot find solution');return;end
C = [A B];

for j = 1:m-1
    for i = j+1:m
        C(i,:) = C(j,:)*(-C(i,j)/C(j,j)) + C(i,:);        
    end
end

x(m) = C(m,m+1)/C(m,m);
for i = m-1:-1:1
    x(i) = (C(i,m+1) - sum(C(i,i+1:m).*x(i+1:m)))/C(i,i); 
end 
disp(C);
end