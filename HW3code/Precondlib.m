%% Solution of x in Ax=b using Gauss Seidel Method
function [X,Y,x]=Precondlib(A,b,tol,maxIt)
    [m,n] = size(A);
    x=zeros(n,1);
    n=size(x,1);
    normVal=Inf; 
    iter = 1;
    Y = [norm(A*x(:)-b,2)];
    while (normVal>tol || iter<=maxIt)
        x_old=x;    
        for i=1:n
            sigma=0;
            for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
            end
            for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
            end
            x(i)=(1/A(i,i))*(b(i)-sigma);
        end
        normVal=norm(x_old-x);
        iter = iter + 1;
        Y=[Y,norm(A*x(:)-b,2)];
    end
    X = [1:iter];
end