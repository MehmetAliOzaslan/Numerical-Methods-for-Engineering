function LU(A,B,I)
% A: mxm matrix
% B: constants vector. (mx1)
% I: mxm unit matrix 
[m,n] = size(A);
if m ~= n;disp('Coefficient matrix must be square matrix');return;end
[~,b] = size(B);if b ~= 1; B = B';end
[p,t] = size(I);if p ~= m || t~= m ;disp('Matrix dimensions must be equal');return;end
if det(A) == 0; disp('The determinant of the coefficient matrix is zero. Cannot find solution');return;end
U = A;
L = ones(m,m);

for i = 1:m
    for j = i+1:m
        L(i,j) = 0;
        for k = 1:m-1
            for x = k+1:m
                L(x,k) = 0;
            end
        end
    end
end

for j = 1:m-1
    for i = j+1:m
        L(i,j) = U(i,j)./U(j,j);
        U(i,:) = U(j,:)*(-U(i,j)/U(j,j)) + U(i,:);  
    end
end

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%s \n', '             L MATRIX');disp(L)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
fprintf('%s \n', '             U MATRIX');disp(U)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
L = [L I];
for j = 1:m-1
    for i = j+1:m
        L(i,:) = L(j,:)*(-L(i,j)/L(j,j)) + L(i,:);  
    end
end

for j = m:-1:1
    for i = j-1:-1:1
        InvMatrixL = L(:,(m+1):end);
    end 
end
fprintf('%s \n', '             INVERSE L MATRIX');disp(InvMatrixL)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
D = zeros(m,1);

for i = 1:m
    for k = 1:m
        D(i,1) = D(i,1) + InvMatrixL(i,k).*B(k,1);
    end 
end
fprintf('%s \n', 'VALUES OF D');disp(D)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
U = [U I];
for j = m:-1:1
    for i = j-1:-1:1
        U(i,:) = (U(j,:)*(-U(i,j)/U(j,j)) + U(i,:))/U(i,i);  
    end 
    U(m,m:end) = U(m,m:end) / U(m,m);
end

for j = m:-1:1
    for i = j-1:-1:1
        InvMatrixU = U(:,(m+1):end);
    end 
end
fprintf('%s \n', '             INVERSE U MATRIX');disp(InvMatrixU)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
Roots = zeros(m,1);
for i = 1:m
    for k = 1:m
        Roots(i,1) = Roots(i,1) + InvMatrixU(i,k).*D(k,1);
    end 
end
fprintf('%s \n', 'ROOTS OF MATRIX');disp(Roots)
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
end
