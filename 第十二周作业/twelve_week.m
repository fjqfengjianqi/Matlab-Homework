%% 数学实验作业第十二周
% 
% 
% 学号：202023092020
% 
% 姓名：冯健齐
%% 
% 
%% P111 2(1)

A=[1 -9 -10;-9 1 5;8 7 1];%录入方程式矩阵
b=[1;0;4];%录入常数项
x=[1 1 1]';%初值
m=x;%第二次迭代
%% 范数的最小化

T=[1 -9 -10;-9 1 5;8 7 1];
E=zeros(3,3);
for i=1:3
    E(1,:)=T(i,:);
    for k=1:3
        if k~=i
           E(2,:)=T(k,:);
           l=6-k-i;
           E(3,:)=T(l,:);
           E
           L=-tril(E,-1);
           U=-triu(E,1);
           D=diag(diag(E));
           B1=D\(L+U);
           s1=norm(B1)
           s2=max(abs(eig(B1)))
        end
    end
end
%% 
% 可见，A=$\left\lbrack \begin{array}{ccc}-9 & 1 & 5\\8 & 7 & 1\\1 & -9 & -10\end{array}\right\rbrack$时的范数可知收敛

A=[-9 1 5;8 7 1;1 -9 -10];
b=[0;4;1];
%% Jacobi迭代

L=-tril(A,-1)%下三角
U=-triu(A,1)%上三角
D=diag(diag(A))%提取并生成对角阵
B1=D\(L+U)%生成系数矩阵
s1=norm(B1)%范数>1, 迭代法不收敛
s2=max(abs(eig(B1)))%特征根的模的最大值<1，迭代法收敛
k=40;%迭代次数
x0=1:k;
y1=zeros(1,k);
y2=zeros(1,k);
y3=zeros(1,k);
for i=1:k
    y1(i)=x(1);
    y2(i)=x(2);
    y3(i)=x(3);
    x=B1*x+D\b;
end
plot(x0,y1,x0,y2,x0,y3);
title('Jacobi迭代');
%% 
% 可见，jacobi在此运算下收敛,结果趋向于[-0.7377 1.6517 -1.6599]，接近于真实结果
%% Gauss-Seideil迭代

B2=(D-L)\U;%生成系数矩阵
s3=norm(B2)%范数>1, 迭代法不收敛
s4=max(abs(eig(B1)))%特征根的模的最大值<1，迭代法收敛
p=25;%迭代次数
m0=1:p;
n1=zeros(1,p);
n2=zeros(1,p);
n3=zeros(1,p);
for i=1:p
    n1(i)=m(1);
    n2(i)=m(2);
    n3(i)=m(3);
    m=B2*m+(D-L)\b;
end
plot(m0,n1,m0,n2,m0,n3);
title('Gauss-Seideil迭代');
%% 
% 可见，Gauss-Seideil在此运算下收敛,结果趋向于[-0.7404 1.6553 -1.6638],接近于真实结果
% 
% 
%% P113 10

A=[-4 1 1 1;1 -4 1 1;1 1 -4 1;1 1 1 -4];%录入方程式矩阵
b=[1;1;1;1];%录入常数项
x=[0 0 0 0]';%初值
L=-tril(A,-1);%下三角
U=-triu(A,1);%上三角
D=diag(diag(A));%提取并生成对角阵
p=10;%迭代次数
w0=[0.75 1.0 1.25 1.5];
k=length(w0);
for j=1:k
    y=[];
    w=w0(j)
    B=(D-w*L)\(w*U+(1-w)*D);
    f=w*(D-w*L)\b;
    x0=1:p;
    for i=1:p
        x=B*x+f;
        y=[y x];
    end
    figure;
    plot(x0,y(1,:),'-o',x0,y(2,:),'-o',x0,y(3,:),'-o',x0,y(4,:),'-o');
    legend('x1','x2','x3','x4')
end
%% 
% 其精确值为[-1 -1 -1 -1]，由上式可知，只有w=1时比较精确
% 
%