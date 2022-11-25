%% *数学实验作业第九周*
% 
% 
% 姓名：冯健齐
% 
% 学号：202023092020
%% 1.1拉格朗日插值函数(见文末）
%% *1.2函数运行测试*

x=[-1:0.05:1];
y1=1./(1+5*x.^2);
x0=[-1:0.5:1];
y0=1./(1+5*x0.^2);
y2=lagrange(x0,y0,x);
plot(x,y1,'-',x,y2,'o-');
legend('原函数','拉格朗日插值函数')
title('拉格朗日函数测试')
%% 2.实验练习1(函数y=(cos(x))^10)

x=[-2:0.05:2];
for n=5:11
    figure(n-4)
    x0=linspace(-2,2,n);
    y0=(cos(x0)).^10;
    y1=(cos(x)).^10;
    y2=lagrange(x0,y0,x);
    y3=interp1(x0,y0,x);
    y4=spline(x0,y0,x);
    plot(x,y1,'-',x,y2,'-o',x,y3,'-h',x,y4,'-*');
    legend('原函数','拉格朗日','分段线性','三次样条')
    title(['节点为',num2str(n),'个'])
end
%% 
% 可以看出适当增加节点数拉格朗日插值函数在边界处震动较大，分段插值函数一直保持良好吻合，三次样条插值函数由震动较大变为震动较小
%% 3.实验练习2
% 拉格朗日插值

x=[0:0.1:16];
y00=5^(1/2);
x00=[0,1,4,9,16];
for i=1:5
    x0=nchoosek(x00,i);
    wucha=10000;
    for j=1:nchoosek(5,i)
        x1=x0(j,:);
        y0=x1.^(1/2);
        y1=lagrange(x1,y0,5);
        if wucha>abs(y1-y00)
            wucha=abs(y1-y00);
            xfinal=x1;
        end
    end
end
disp(x1)
disp(wucha)
% 分段插值

x=[0:0.1:16];
y00=5^(1/2);
x00=[0,1,4,9,16];
for i=2:5
    x0=nchoosek(x00,i);
    wucha=10000;
    for j=1:nchoosek(5,i)
        x1=x0(j,:);
        y0=x1.^(1/2);
        y1=interp1(x1,y0,5);
        if wucha>abs(y1-y00)
            wucha=abs(y1-y00);
            xfinal=x1;
        end
    end
end
disp(x1)
disp(wucha)
% 三次样条插值

x=[0:0.1:16];
y00=5^(1/2);
x00=[0,1,4,9,16];
for i=2:5
    x0=nchoosek(x00,i);
    wucha=10000;
    for j=1:nchoosek(5,i)
        x1=x0(j,:);
        y0=x1.^(1/2);
        y1=spline(x1,y0,5);
        if wucha>abs(y1-y00)
            wucha=abs(y1-y00);
            xfinal=x1;
        end
    end
end
disp(x1)
disp(wucha)
%% 
% 综上所述，应该使用0，1，4，9，16来进行插值，更加准确，此函数中，分段插值更加精确
%% 注：练习1中的所有数据

x=[-2:0.05:2];
for n=5:11
    figure(n-4)
    x0=linspace(-2,2,n);
    y0=(cos(x0)).^10;
    y1=(cos(x)).^10;
    y2=lagrange(x0,y0,x);
    y3=interp1(x0,y0,x);
    y4=spline(x0,y0,x);
    disp(y2)
    disp(y3)
    disp(y4)
end
%% 注：拉格朗日插值函数

function y=lagrange(x0,y0,x)%输入x0和y0，得到一个关于x的函数
xn0=length(x0);
xn=length(x);
y=zeros(1,xn);
for i=1:xn
    xx=x(i);
    A1=0;
    for j=1:xn0
        A2=1;
        for k=1:xn0
            if k~=j
            A2=A2*(xx-x0(k))/(x0(j)-x0(k));%计算基函数
            end
        end
        A1=A1+A2*y0(j);
    end
    y(i)=A1;
end
end