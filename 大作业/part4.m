%输入第二层矩阵的值
AA=[1 1/2 4 3 3;
    2 1 7 5 5;
    1/4 1/7 1 1/2 1/3;
    1/3 1/5 2 1 1;
    1/3 1/5 3 1 1];
[VV,DD] = eig(AA);
Max_eigAA = max(max(DD));%求最大特征值
[rr,cc]=find(DD == Max_eigAA , 1);
%找到最大的特征值对应的特征向量
wA=VV(:,cc) ./ sum(VV(:,cc));

%录入第三层矩阵的值
B=[1 2 5;1/2 1 2;1/5 1/2 1];%B1
B=[B [1 1/3 1/8;3 1 1/3;8 3 1]];%B2
B=[B [1 1 3;1 1 3;1/3 1/3 1]];%B3
B=[B [1 3 4;1/3 1 1;1/4 1 1]];%B4
B=[B [1 1 1/4;1 1 1/4;4 4 1]];%B5
wB=[];
for i=1:5
    A=B(:,[3*i-2:3*i]);
    [V,D] = eig(A);
    Max_eig = max(max(D));%求最大特征值
    [r,c]=find(D == Max_eig , 1);
    %找到最大的特征值对应的特征向量
    wB=[wB V(:,c) ./ sum(V(:,c))];
end
disp('第一层各个权重值');
disp(wA);
disp('第二层各个权重值');
disp(wB);

%计算各个因素的总权重
E=[];
for j=1:3
    W=wB(j,:)*wA;
    E=[E;W];
end
disp('第二层对总方案的权重');
disp(E);