%一共有17个数，1，2，3……9，1/2，1/3……1/9
%按照1/17的平均概率均匀随机的抽取n^2个数，构成判断随机矩阵
%计算多次的平均值
clear
a=[9 8 7 6 5 4 3 2 1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9];
for k=2:50 %计算1到50阶的矩阵
    for n=1:10000 %对随机矩阵计算10000次
        A=ceil(17*rand(k)); %生成随机矩阵
        for i=1:k
            for j=i:k
                AA(i,j)=a(A(i,j));
                AA(j,i)=1/AA(i,j);
                AA(i,i)=1;
            end
        end
        BB=ones(k,k);
        for jj=1:k
            he=sum(AA(:,jj));
            BB(:,jj)=AA(:,jj)/he;
        end
        w=ones(k,1);
        for ii=1:k
            w(ii)=sum(BB(ii,:));
        end
        w=w./sum(w); %向量正规化
        L=sum((AA*w./(k.*w))); %正规化对应的最大特征值
        CI(n)=(L-k)/(k-1);
    end
    RI(k)=sum(CI)./n; %计算平均随机一致性指标
end