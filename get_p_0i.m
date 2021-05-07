function p = get_p_0i(alpha,d,theta,r,i)
if not(isequal(size(alpha),size(d),size(theta),size(r)))
    error('Geometric Model: parameter vectors need to have the same length')
end
g_06 = eye(4); % initial value
for k = 1:i
    g_06 = g_06 * TransformMatElem(alpha(k),d(k),theta(k),r(k));
end
p=g_06(1:3,4);
end