function Ploting2()
    m=500;
    n=500;
    N=20;
    figure();
    t=0.1;
    [A,b] = genA(m,n,t);
    [XCG,YCG,x,r]=CG(A,b,N);
    [Xsteep,Ysteep,x,r]=steepest(A,b,N);
    %[Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(XCG,YCG)
    hold on;
    semilogy(Xsteep,Ysteep)
    hold on;

    t=0.05;
    [A,b] = genA(m,n,t);
    [XCG,YCG,x,r]=CG(A,b,N);
    [Xsteep,Ysteep,x,r]=steepest(A,b,N);
    %[Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(XCG,YCG)
    hold on;
    semilogy(Xsteep,Ysteep)
    hold on;

    t=0.01;
    [A,b] = genA(m,n,t);
    [XCG,YCG,x,r]=CG(A,b,N);
    [Xsteep,Ysteep,x,r]=steepest(A,b,N);
    %[Xcond,Ycond, Ybound]=condition(A,b,N,x)
    semilogy(XCG,YCG)
    hold on;
    semilogy(Xsteep,Ysteep)
    hold on;

    
    title({'steepest descent method vs Conjugate gradient method'})
    legend({'\tau=0.1 CG','\tau=0.1 steepest descent','\tau=0.05 CG','\tau=0.05 steepest descent','\tau=0.01 CG','\tau=0.01 steepest descent'},'Location','northeast');
    ylim([10^(-20),10^4]);
    xlim([1,21]);
    set(gca,'YTick',[10^(-18),10^(-12),10^(-8),10^(-4),10^(0),10^(4)])

    xlabel('n');
    ylabel({'$$||r_n||$$'},'Interpreter','Latex');
    set(get(gca,'ylabel'),'rotation',0)
end