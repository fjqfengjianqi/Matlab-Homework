function y = odeuler(odefun, t0, h, tfinal, y0)
t = t0 : h : tfinal; 
y = zeros(size(t)); 
y(1) = y0; 
for k = 1 : (length(t)-1) % ���μ���ÿ����
    s = odefun(t(k), y(k)); % ��ǰ�㴦���ߵ�б��
    y(k+1) = y(k) + h * s; % ��һ����yֵ�Ľ��ƽ�
end
