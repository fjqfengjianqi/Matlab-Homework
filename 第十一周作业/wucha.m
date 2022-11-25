function s=wucha(x,y1,y2)
%x为自变量，y1为一个函数值，y2为另一函数值
t=length(x);
s=0;
for i=1:t
    s=s+abs(y1(t)-y2(t));
end
s=s/t;