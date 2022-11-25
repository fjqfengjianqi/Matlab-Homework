function [r, t, xv] = newton(f, df, x0, n, tol)
x(1) = x0;
x(2) = x(1) - f(x(1)) / df(x(1));
k=2;
while abs(x(k) - x(k-1)) > tol*abs(x(k))
    x(k+1) = x(k) - f(x(k)) / df(x(k));
    k = k + 1;
    if(k > n)
        error('Error');
    end
end
r = x(k); % root
if nargout > 1
    t = k - 1;
end
if nargout == 3
    xv = x;
end
end