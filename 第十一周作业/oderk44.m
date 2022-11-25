   function y = oderk44(odefun, t0, h, tfinal, y0)
   % oderk44  Classical Runge-Kutta ODE solver.
   %   y = oderk44(odefun,t0,h,tfinal,y0) uses the classical
   %   Runge-Kutta method with fixed step size h on the interval
   %      t0 <= t <= tfinal
   %   to solve
   %      dy/dt = odefun(t,y)
   %   with y(t0) = y0.
    t = t0 : h : tfinal; % 微分方程自变量向量
    y = zeros(size(t)); % 微分方程数值解向量
    y(1) = y0; % 初值   
    for k = 1 : (length(t)-1) % 依次计算每个点
        s1 = odefun(t(k), y(k)); % 区间左端点斜率
        s2 = odefun(t(k)+h/2, y(k)+h*s1/2); % 区间中点斜率1
        s3 = odefun(t(k)+h/2, y(k)+h*s2/2); % 区间中点斜率2
        s4 = odefun(t(k)+h, y(k)+h*s3); % 区间右端点斜率
        y(k+1) = y(k) + h*(s1 + 2*s2 + 2*s3 + s4)/6; % 四个点斜率的线性组合
    end
