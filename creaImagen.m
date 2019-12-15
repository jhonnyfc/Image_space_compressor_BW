function sol = creaImagen(A,B)
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
    
    sol = Ri*255;
    sol = uint8(sol);
end