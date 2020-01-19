function sol = actualizaElementoDeA(A,B,R,alpha,r,t)
    col = size(B,2);
    c = size(A,1);% == size(B,1)
    fil = 1:c~=r;
    
%%Sumatorio    
    sum1 = 0;
    for j = 1:col
        %%2� opLog
        terVal = (A(r,t) <= B(r,j));
        
        if (terVal ~= 0)
            %%Resta 1
            primVal = R(t,j) - max(min(A(:,t),B(:,j)));
            %%1� opLog
            secVal = (min(A(r,t),B(r,j)) >= max(min(A(fil,t),B(fil,j))));

            sum1 = sum1 + primVal*secVal*terVal;
        else
            sum1 = sum1 + 0;
        end 
    end
%Sol
    sol = A(r,t) + 2*alpha*sum1;
end