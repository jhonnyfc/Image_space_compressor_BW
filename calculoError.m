function Q = calculoError(A,B,R)
    row = size(A,2);
    col = size(B,2);
    c = size(A,1);% == size(B,1)
    
    Ri = zeros(row,col);
    
    aux = zeros(1,c);
    for i = 1:row
        for j = 1:col
            for f = 1:c
                aux(f) = min(A(f,i),B(f,j));
            end
            Ri(i,j) = max(aux);
        end
    end

    %imshow(Ri)
    Q =  sum(sum((Ri - R).^2));
end