   function y = oderk44(odefun, t0, h, tfinal, y0)
   % oderk44  Classical Runge-Kutta ODE solver.
   %   y = oderk44(odefun,t0,h,tfinal,y0) uses the classical
   %   Runge-Kutta method with fixed step size h on the interval
   %      t0 <= t <= tfinal
   %   to solve
   %      dy/dt = odefun(t,y)
   %   with y(t0) = y0.
    t = t0 : h : tfinal; % ΢�ַ����Ա�������
    y = zeros(size(t)); % ΢�ַ�����ֵ������
    y(1) = y0; % ��ֵ   
    for k = 1 : (length(t)-1) % ���μ���ÿ����
        s1 = odefun(t(k), y(k)); % ������˵�б��
        s2 = odefun(t(k)+h/2, y(k)+h*s1/2); % �����е�б��1
        s3 = odefun(t(k)+h/2, y(k)+h*s2/2); % �����е�б��2
        s4 = odefun(t(k)+h, y(k)+h*s3); % �����Ҷ˵�б��
        y(k+1) = y(k) + h*(s1 + 2*s2 + 2*s3 + s4)/6; % �ĸ���б�ʵ��������
    end
