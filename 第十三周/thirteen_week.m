%% 数学实验作业第十三周

xx=linspace(-5,5,100);
y=sin(xx)-(xx.^2)/2;
plot(xx,y,[-5,5],[0,0]);
title('初步分析函数');
%% 
% 有图以及函数性质可知，有两个根，一个在0附近，一个在[1,2]上
%% fzero程序

fun=@(x) sin(x)-(x^2)/2;%输入方程
options=optimset('TolX',1e-10,'Display','off');
for x0=[0 1 2]
    x0
    [x,fv,ef,out]=fzero(fun,x0,options);
    vpa(x,10)
    times=out.iterations
end
%intervaliterations求包含根的区间所采取的迭代次数
%iterations 求零点迭代次数
%funcCount 函数计算次数
%algorithm 'bisection, interpolation'
%message 退出消息
%% 
% 可见，根约为0与$1.404414824$
% 分析收敛域

for x0=[0 1 2 5 10 14 15]
    x0
    [x,fv,ef,out]=fzero(fun,x0);
    times=out.iterations
end
%由数据可以初步分析看出，0的收敛域(-oo,a)中a在[0,1]之间
%第二个根的收敛域(a,b)中b在[14,15]之间
a=0.7;
ten=1*10^-5;
x1=0;
while(x1<1)
    a=a+ten;
    x1=fzero(fun,a,options);
end
a
b=14.7;
x2=1.4;
while(x2<2)
    b=b+ten;
    x2=fzero(fun,b,options);
end
b
%% 
% 可见收敛域为（-oo，0.7372）与（0.7372，14.7984）
%% fsolve程序

clear;clc;
fun=@(x) sin(x)-(x^2)/2;%输入方程
options=optimset('tolx',1e-10,'Display','off');
for x0=[0 1 2]
    x0
    [x,fv,ef,out]=fsolve(fun,x0,options);
    x=vpa(x,10)
    times=out.iterations
end
%% 
% 可见，根约为0与$1.404414824$
% 分析收敛域

options=optimset('tolx',1e-10,'Display','off');
for x0=[0 1 2 5 10 14 15 50 100 1000 10^5 10^10]
    x0
    [x,fv,ef,out]=fsolve(fun,x0,options);
    x=vpa(x,10)
    times=out.iterations
end
%由数据可以初步分析看出，0的收敛域(-oo,a)中a在[0,1]之间
%第二个根的收敛域为(a,+oo)
a=0.7;
ten=1*10^-5;
x1=0;
while(x1<1)
    a=a+ten;
    x1=fsolve(fun,a,options);
end
a
%% 
% 由分析可见，收敛域为（-oo,0.7391)与(0.7391,+oo)
%% 迭代法求解

clear;clc;
wucha=1e-10;
i=1;
cha=1;
x(1)=1;
while(abs(cha)>wucha)
    x(i+1)=(2*sin(x(i)))^0.5;
    cha=x(i+1)-x(i);
    i=i+1;
end
x=vpa(x',10);
disp(x);
i
%% 
% 0的解显而易见，关于另一个解，可见迭代法求出的解与上面一致
%% 牛顿法

clear;clc;
f=@(x) sin(x)-(x^2)/2;%输入方程
df=@(x) cos(x)-x;
[x k xv]=new(f,df,1,100,1e-10);
x=vpa(x,10)
k
xv
%% 
% 可见牛顿法求解也一致，而且相对于迭代法，迭代次数较少

function [r, t, xv] = newton(f, df, x0, n, tol)
x(1) = x0;
x(2) = x(1) - f(x(1)) / df(x(1));
k=2;
while abs(x(k) - x(k-1)) > tol*abs(x(k))
    x(k+1) = x(k) - f(x(k)) / df(x(k));
    k = k + 1;
    if(k > n)
        error('Error');
    end
end
r = x(k); % root
if nargout > 1
    t = k - 1;
end
if nargout == 3
    xv = x;
end
end