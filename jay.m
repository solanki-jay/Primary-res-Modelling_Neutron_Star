r = [0:0.00001:1];
k = -0.44;
p = .09;

% denity = d
d = (1+k)*((3+(r).^2)./(1+(r).^2).^2);
plot(r,d), xlabel('Normalized Radius $$\frac{r}{R}$$','Interpreter','latex','fontsize',12);
ylabel('density (gm/cm^3) * 2*10^{14}','fontsize',14), title('density curve','fontsize',15);
ylim([0 3]);
solar = char(9737);
str1 = {' R = 16.169 km' 'M = 1.5 (solar mass)', ' p_0 = 0.09, k = -0.44'};
ann = annotation('textbox', [0.5, 0.7, 0.35, 0.15], 'string', str1);
figure();

% radial pressure = pr
pr= (p)*((1 - k*(r).^2).*(1 - (r).^2))./(1 + (r).^2).^2;

% v' = v1
v1 = (p*(1 - r.^2).*r)./(1 + r.^2) + ((1+k)*r)./(1 - k*r.^2);
% v'' = v2
v2 = (p*(1 - 4*r.^2 - r.^4))./(1 + r.^2).^2 + ((1+k)*(1 + k*r.^2))./(1 - k*r.^2).^2;
% lambda' = l
l = (2*(k+1)*r)./((1 + r.^2).*(1 - k*r.^2));
% e^-(lambda) = el
el = (1 - k*r.^2)./(1 + r.^2);
% tangential presure = pt
pt = (el./4).*(2*v2 + (v1 - l).*(v1 + 2./r));

plot(r,pr, r,pt), xlabel('Normalized Radius $\frac{r}{R}$','Interpreter','latex','fontsize',12);
ylabel(' pressure ( gm/cm/s^2 ) * 18*10^{32}','fontsize',14), title('pressure curves','fontsize',15);
legend('p_r','p_t')
figure();

% dpt/dr = dpt
dpt = diff(pt)./diff(r);
% dpr/dr = dpr 
dpr = diff(pr)./diff(r);
plot(r(2:end),dpr, r(2:end),dpt),xlabel('Normalized Radius $\frac{r}{R}$','Interpreter','latex','fontsize',12);
ylabel('$\frac{dp}{dr} ( gm/cm^2/s^2 ) * 1.11*10^27$','Interpreter','latex','fontsize',14);
title('$\frac{dp}{dr}$ curves','Interpreter','latex','fontsize',15);
legend('$\frac{dp_r}{dr}$','$\frac{dp_t}{dr}$','Interpreter','latex','fontsize',13)
figure();

% d(rho)/dr = dd
dd = diff(d)./diff(r);
% dpr/d(rho) = dprd
dprd = dpr./dd;
% dpt/d(rho) = dptd
dptd = dpt./dd;
plot(r(2:end),dprd, r(2:end),dptd) ,xlabel('Normalized Radius $\frac{r}{R}$','Interpreter','latex','fontsize',12);
ylabel('$\frac{dp}{d\rho}$','Interpreter','latex','fontsize',14);
title('$\frac{dp}{d\rho}$ curves','Interpreter','latex','fontsize',15);
legend('$\frac{dp_r}{d\rho}$','$\frac{dp_t}{d\rho}$','Interpreter','latex','fontsize',13)
figure();

stb = dptd - dprd;
plot(r(2:end),stb),xlabel('Normalized Radius $\frac{r}{R}$','Interpreter','latex','fontsize',12);
ylabel('$\frac{dp_t}{d\rho}$ - $\frac{dp_r}{d\rho}$','Interpreter','latex','fontsize',14);
title('$\frac{dp_t}{d\rho}$ - $\frac{dp_r}{d\rho}$ curve','Interpreter','latex','fontsize',15);











