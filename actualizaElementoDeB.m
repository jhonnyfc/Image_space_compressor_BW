function sol = actualizaElementoDeB(A,B,R,alpha,r,t)
    row = size(A,2);
    c = size(A,1);% == size(B,1)
    
%%Sumatorio    
    sum1 = 0;
    for i = 1:row
        %%Resta 1
        primVal = R(i,t) - max(min(A(:,i),B(:,t)));
        %%1� opLog
        secVal = (min(A(r,i),B(r,t)) >= max(min(A(1:c~=r,i),B(1:c~=r,t))));
        %%2� opLog
        terVal = (B(r,t) <= A(r,i));
        
        sum1 = sum1 + primVal*secVal*terVal;
    end

%Sol
    sol = B(r,t) + 2*alpha*sum1;
end