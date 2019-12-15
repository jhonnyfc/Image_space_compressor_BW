function sol = actualizaElementoDeA(A,B,R,alpha,r,t)
    col = size(B,2);
    c = size(A,1);% == size(B,1)
    
%%Sumatorio    
    sum1 = 0;
    for j = 1:col
        %%Resta 1
        primVal = R(t,j) - max(min(A(:,t),B(:,j)));
        %%1� opLog
        secVal = (min(A(r,t),B(r,j)) >=  max(min(A(1:c~=r,t),B(1:c~=r,j))));
        %%2� opLog
        terVal = (A(r,t) <= B(r,j));
        
        sum1 = sum1 + primVal*secVal*terVal;
    end
%Sol
    sol = A(r,t) + 2*alpha*sum1;
end