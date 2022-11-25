%% 数学实验第十周作业
% 
% 
% 学号：202023092020
% 
% 姓名：冯健齐
% 
% 
%% 
% 
%% 课后题P65.10

%数据采集
x0=[0 3 5 7 9 11 12 13 14 15];
y1=[0 1.8 2.2 2.7 3.0 3.1 2.9 2.5 2.0 1.6];%上线
y2=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];%下线
%lagrange插值计算y坐标
xx=[0:0.1:15];
y01=lagrange(x0,y1,xx);
y02=lagrange(x0,y2,xx);
plot(xx,y01,xx,y02);
title('lagrange插值图像');
%三次样条插值
y11=spline(x0,y1,xx);
y12=spline(x0,y2,xx);
plot(xx,y11,xx,y12);
title('三次样条插值图像');
%分段线性插值
y21=interp1(x0,y1,xx);
y22=interp1(x0,y2,xx);
plot(xx,y21,xx,y22);
title('分段线性插值图像');
%% 
% 经观察可知，以上的三个插值中三次样条拟合较好，lagrange插值在0处波动较大，与其插值原理有关，综上所述，采用三次样条插值。
% 
% *所求的y的坐标即y11与y12，放在附录展示。*

%画出曲线
plot(xx,y11,xx,y12);
title('模拟机翼剖面轮廓线');
%求机翼面积,这里采用梯形面积计算
s=trapz(xx,y11)-trapz(xx,y12);
disp('面积为');
disp(s);
%% 
% 可知面积约为11.34。
%% 课后题P66.12

%用梯形面积求其积分
%注意到题目中记录间隔为1min，要将题目的时间转化为分钟
t0=[0 2 4 5 6 7 8 9 10.5 11.5 12.5 14 16 17 18 19 20 21 22 23 24];
t=60*t0;%各个时间点
car=[2 2 0 2 5 8 25 12 5 10 12 7 9 28 22 10 9 11 8 9 3];
%lagrange插值下计算
tt0=[0:12:24*60];
car1=lagrange(t,car,tt0);
plot(tt0,car1);
title('lagrange插值模拟车流');
%三次样条插值下计算
car2=spline(t,car,tt0);
plot(tt0,car2);
title('三次样条插值模拟车流');
%分段线性插值下计算
car3=interp1(t,car,tt0);
plot(tt0,car3);
title('分段线性插值模拟车流');
%当天车流
cars0=trapz(t,car);
cars1=trapz(tt0,car1);
cars2=trapz(tt0,car2);
cars3=trapz(tt0,car3);
'当天车流量（直接）'
disp(cars0);
'当天车流量（拉格朗日插值）'
disp(cars1);
disp('当天车流量（三次样条插值）');
disp(cars2);
disp('当天车流量（分段线性插值）');
disp(cars3);
%% 
% 可见，三次样条插值的模拟更加符合，即当天车流量以约为12665辆/天
%% 附录(10中数据)

disp(y11);
disp(y12);
%% 
% 
% 
%