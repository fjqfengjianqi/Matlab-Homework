function v = jisi(t, pos, vs, vr, c)
% v: revenuer speed component [vx vy]
% t: time vector
% pos: position of the revenuer, form like: [x y]
% vs: speed of the smuggler
% vr: speed of the revenuer
% c: initial distance between the revenuer and the smuggler
%
% Author: YangXiaodong
% E-mail: xd@sdu.edu.cn

x = pos(1); % position x
y = pos(2); % position y
s = sqrt((c - x)^2 + (vs * t - y)^2); % common denominator
v = [vr * (c - x) / s        % vx
     vr * (vs * t - y) / s]; % vy
end