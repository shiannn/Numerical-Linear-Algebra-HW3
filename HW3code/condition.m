function [X,Y,Y2]=condition(A,b,N,xCG)
    [m,n] = size(A);
    %kappa = norm(inv(A),2)*norm(A,2);
    %using eigenvalue to get kappa
    [V,D]=eig(A);
    lambda_max = max(max(diag(D)));
    lambda_min = min(min(diag(D)));
    kappa = lambda_max/lambda_min;

    xT = A\b;
    %norm(A*xT-b,2)
    e = zeros(m,N+1);

    e(:,1) = xT-xCG(:,1);
    e1A = sqrt(e(:,1)'*A*e(:,1))
    
    X = [1:N+1];
    Y = zeros(1,N+1);
    Y2 = zeros(1,N+1);
    Y(1,1) = 1;
    Y2(1,1) = 1;
    for i=2:N+1
        e(:,i) = xT-xCG(:,i);
        eiA = sqrt(e(:,i)'*A*e(:,i));
        ratio = eiA / e1A;
        bound = 2*(((sqrt(kappa)-1)/(sqrt(kappa)+1))^(i-1));
        %[ratio,bound]
        Y(1,i) = ratio;
        Y2(1,i) = bound;
    end

end