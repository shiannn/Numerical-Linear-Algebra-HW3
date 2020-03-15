function [X,Y,x,r]=steepest(A,b,N)
    [m,n] = size(A);
    Alpha = zeros(1,N+1); %20 iteration
    r = zeros(m,N+1); %20 iteration residual
    x = zeros(n,N+1); %20 iteration

    x(:,1)=zeros(n,1);
    r(:,1)=b; %m

    X = [1:N+1];
    Y = zeros(1,N+1);
    Y(1,1) = norm(r(:,1),2);
    for i=2:N+1
        Aup = r(:,i-1)'*r(:,i-1);
        Adown = r(:,i-1)'*A*r(:,i-1);
        Alpha(1,i) = Aup/Adown;
        
        x(:,i) = x(:,i-1)+Alpha(1,i)*r(:,i-1);
        r(:,i) = r(:,i-1)-Alpha(1,i)*(A*r(:,i-1)); %steepest

        Y(1,i) = norm(A*x(:,i)-b,2);
    end
end