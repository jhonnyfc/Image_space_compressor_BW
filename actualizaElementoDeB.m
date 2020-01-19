function sol = actualizaElementoDeB(A,B,R,alpha,r,t)
    row = size(A,2);
    c = size(A,1);% == size(B,1)
    fil = 1:c~=r;
    
%%Sumatorio    
    sum1 = 0;
    for i = 1:row
        %%2� opLog
        terVal = (B(r,t) <= A(r,i));
        
        if (terVal ~= 0)
            %%Resta 1
            primVal = R(i,t) - max(min(A(:,i),B(:,t)));
            %%1� opLog
            secVal = (min(A(r,i),B(r,t)) >= max(min(A(fil,i),B(fil,t))));

            sum1 = sum1 + primVal*secVal*terVal;
        else
            sum1 = sum1 + 0;
        end
    end
%Sol
    sol = B(r,t) + 2*alpha*sum1;
end