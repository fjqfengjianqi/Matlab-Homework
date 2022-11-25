function y = odeuler(odefun, t0, h, tfinal, y0)
t = t0 : h : tfinal; 
y = zeros(size(t)); 
y(1) = y0; 
for k = 1 : (length(t)-1) % 依次计算每个点
    s = odefun(t(k), y(k)); % 当前点处切线的斜率
    y(k+1) = y(k) + h * s; % 下一个点y值的近似解
end
