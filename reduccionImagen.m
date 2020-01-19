function sol = reduccionImagen(R,c,alpha,umbral,maxIter)
    col = size(R,1);
    row = size(R,2);

    A = rand(c,row);
    B = rand(c,col);

    qant = 0;
    qnow = calculoError(A,B,R);
    iterNow = 1;
    while ( abs(qnow - qant) > umbral && iterNow <= maxIter)
        qant = qnow;
        Aant = A;
        Bant = B;
        for i = 1:c
            for j = 1:row
                A(i,j) = actualizaElementoDeA(Aant,Bant,R,alpha,i,j);
            end
        end
        for i = 1:c
            for j = 1:col
                B(i,j) = actualizaElementoDeB(Aant,Bant,R,alpha,i,j);
            end
        end
        
        qnow = calculoError(A,B,R);
        fprintf("Iteracion: %d, error %d\n",iterNow,qnow);
        
        if (mod(iterNow,5) == 0)% Cada x iteraciones mostramos la reconstruccion
            imRed = creaImagen(A,B);
            imshow(imRed);
        end
        
        iterNow = iterNow + 1;
    end
    
    %fprintf("El error es: %.4f\n",calculoError(A,B,R));
    sol = creaImagen(A,B);
end