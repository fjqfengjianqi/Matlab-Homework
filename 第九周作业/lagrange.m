function y=lagrange(x0,y0,x)%输入x0和y0，得到一个关于x的函数
%% LAGRANGE 1.1拉格朗日插值函数
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