function [X,Y,x,r]=CG(A,b,N)
    [m,n] = size(A);
    Alpha = zeros(1,N+1); %20 iteration
    Beta = zeros(1,N+1); %20 iteration
    r = zeros(m,N+1); %20 iteration residual
    p = zeros(m,N+1); %20 iteration
    x = zeros(n,N+1); %20 iteration

    x(:,1)=zeros(n,1);
    r(:,1)=b; %m
    p(:,1)=r(:,1);

    X = [1:N+1];
    Y = zeros(1,N+1);
    Y(1,1) = norm(r(:,1),2);
    for i=2:N+1
        Aup = r(:,i-1)'*r(:,i-1);
        Adown = p(:,i-1)'*A*p(:,i-1);
        Alpha(1,i) = Aup/Adown;
        
        x(:,i) = x(:,i-1)+Alpha(1,i)*p(:,i-1);

        r(:,i) = r(:,i-1)-Alpha(1,i)*A*p(:,i-1);

        Bup = r(:,i)'*r(:,i);
        Bdown = r(:,i-1)'*r(:,i-1);
        Beta(1,i) = Bup/Bdown;

        p(:,i) = r(:,i)+Beta(1,i)*p(:,i-1);
        norm(r(:,i),2)
        
        Y(1,i) = norm(A*x(:,i)-b,2);
    end
    %norm(r(:,N+1),2)
end