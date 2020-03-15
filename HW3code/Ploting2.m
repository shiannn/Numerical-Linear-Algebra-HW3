function Ploting2()
    m=500;
    n=500;
    N=20;
    figure();
    t=0.1;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    [Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(Xcond,Ycond)
    hold on;
    semilogy(Xcond,Ybound)
    hold on;

    t=0.05;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    [Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(Xcond,Ycond)
    hold on;
    semilogy(Xcond,Ybound)
    hold on;

    t=0.01;
    [A,b] = genA(m,n,t);
    [X,Y,x,r]=CG(A,b,N);
    [Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(Xcond,Ycond)
    hold on;
    semilogy(Xcond,Ybound)
    hold on;

    title({'convergence rate and estimate'})
    legend({'\tau=0.1 convergence rate','\tau=0.1 estimate','\tau=0.05 convergence rate','\tau=0.05 estimate','\tau=0.01 convergence rate','\tau=0.01 estimate',},'Location','northeast');
    ylim([10^(-20),10^4]);
    xlim([1,21]);
    xlabel('n');
    ylabel({'$$2*(\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1})^n$$','and $$\frac{||e_n||_A}{||e_0||_A}$$'},'Interpreter','Latex');
    set(gca,'YTick',[10^(-18),10^(-12),10^(-8),10^(-4),10^(0),10^(4)])
    set(get(gca,'ylabel'),'rotation',45)

end