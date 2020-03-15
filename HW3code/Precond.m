function [X,Y,x] = Precond(A,b,N)
    [m,n]=size(A);
    C=getPreconditioner(A);
    x = zeros(n,N+1); %20 iteration
    r = zeros(m,N+1); %20 iteration residual
    z = zeros(m,N+1);
    d = zeros(m,N+1);
    r(:,1) = b-A*x(:,1);
    z(:,1) = inv(C)*r(:,1);
    d(:,1) = z(:,1);

    Alpha = zeros(1,N+1);
    Beta = zeros(1,N+1);

    X = [1:N+1];
    Y = zeros(1,N+1);
    Y(1,1) = norm(r(:,1),2);
    for i=1:N+1
        Aup = z(:,i)'*r(:,i);
        Adown = d(:,i)'*A*d(:,i);
        Alpha(1,i)=Aup/Adown;

        x(:,i+1)=x(:,i)+Alpha(1,i)*d(:,i);
        r(:,i+1)=r(:,i)-Alpha(1,i)*A*d(:,i);
        z(:,i+1)=inv(C)*r(:,i+1);
        Beta(:,i+1)=(z(:,i+1)'*r(:,i+1))/(z(:,i)'*r(:,i));
        d(:,i+1)=z(:,i+1)+Beta(:,i+1)*d(:,i);

        %Y(1,i) = norm(A*x(:,i)-b,2);
        Y(1,i) = norm(r(:,i),2);
        Y(1,i)';
    end
    semilogy(X,Y)
    ylim([10^(-20),10^4]);
    xlim([1,21]);
    set(gca,'YTick',[10^(-18),10^(-12),10^(-8),10^(-4),10^(0),10^(4)])
end

function C=getPreconditioner(A)
    [m,n]=size(A);
    C = zeros(m,n);
    for i=1:m 
        for j=1:n
            if(i>=j)
                C(i,j) = A(i,j);
            end
        end
    end
end