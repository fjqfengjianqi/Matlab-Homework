%输入矩阵的值
A=[1 1/2 4 3 3;
    2 1 7 5 5;
    1/4 1/7 1 1/2 1/3;
    1/3 1/5 2 1 1;
    1/3 1/5 3 1 1]
[n,n] = size(A);

%方法1：算术平均法求权重
SumA = sum(A);
SummA = repmat(SumA,n,1);
StandA = A ./ SummA;
disp('算术平均法求权重的结果为：');
%求行和之后再求平均
disp(sum(StandA,2)./n)

%方法2：几何平均法求权重
HangA = prod(A,2);%求行的乘积
JiheA = HangA .^ (1/n);%每行的几何平均
disp('几何平均法求权重的结果为：');
%求平均数
disp(JiheA ./ sum(JiheA))

%方法3：特征值法求权重
[V,D] = eig(A);
Max_eig = max(max(D));%求最大特征值
[r,c]=find(D == Max_eig , 1);
disp('特征值法求权重的结果为：');
%找到最大的特征值对应的特征向量
disp( V(:,c) ./ sum(V(:,c)) )

%下面计算一致性比例CR
CI = (Max_eig - n) / (n-1);
RI=[ 0 1e-10 0.50453 0.90884 1.13579 1.28758 1.39181 1.42631 1.46843 1.51110 1.54223];
% 这里n=2时，一定是一致矩阵，所以CI=0，为了避免分母为0，
%将这里的第二个元素改为了很接近0的正数

CR=CI/RI(n);
disp('一致性指标CI=');disp(CI);
disp('一致性比例CR=');disp(CR);
if CR<0.10
    disp('CR < 0.10，所以该判断矩阵A的一致性可以接受');
else
    disp('CR >= 0.10，该判断矩阵A需要进行修改');
end