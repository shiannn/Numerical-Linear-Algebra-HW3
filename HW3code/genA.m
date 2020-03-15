function [A,b] = genA(m,n,t)
    % 1 at diagonal
    % random [-1,1] at each off-diagonal (symmtric)
    % each off-diagonal if abs()>t become zero
    A = zeros(m,n);
    for i = 1:m
        for j = 1:i
            if(i==j)
                A(i,j) = 1;
            else
                putIn = (-1+2*rand(1,1));
                if(abs(putIn)>t)
                    A(i,j) = 0;
                    A(j,i) = 0;
                else
                    A(i,j) = putIn;
                    A(j,i) = putIn;
                end
            end
        end
    end
    b = -1+2*rand(m,1);
    %b = rand(m,1);
end