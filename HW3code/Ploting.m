function Ploting()
    m=500;
    n=500;
    N=20;
    figure();
    t=0.2;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    semilogy(X,Y)
    hold on;

    t=0.1;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    semilogy(X,Y)

    t=0.05;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    semilogy(X,Y)

    t=0.01;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    semilogy(X,Y)
    
    title({'conjugate gradient method with \tau=0.1,0.05,0.01 in 20 steps'})
    legend({'\tau=0.2','\tau=0.1','\tau=0.05','\tau=0.01'},'Location','southwest');
    ylim([10^(-20),10^4]);
    xlim([1,21]);
    set(gca,'YTick',[10^(-18),10^(-12),10^(-8),10^(-4),10^(0),10^(4)])
    xlabel('n');
    ylabel({'$$||r_n||$$'},'Interpreter','Latex');
    set(get(gca,'ylabel'),'rotation',0)
end