d1 = 165; 
d2 = 148.5;
d3 = 16.5; 
d4 = 16.5; 
d5 = 24.75;   
m = 25; 


C = [d1;0;0];
D = [d1+d2;0;0];
rMx = [d1+d2;0;0];

B = [0;d4+d5;0];
rMy = [d1;d4;0];

Mm = cross(rMx,[0;-m*9.81;0]);
Fbcy = -Mm(3)/d1

syms Fbcx
Fbc = [Fbcx;-Fbcy;0];
rStick = [d1;-d4-d5;0];
Mbc = cross(rStick,Fbc);
rcoll = [d1;-d5;0];
Mcoll = cross(rcoll,[m*9.81;0;0]);
Fbcx = vpa(solve(Mbc(3)+Mcoll(3) == 0,Fbcx))

Fc = [-Fbcx;Fbcy;0];

Fb = [-m*9.81-Fbcx;Fbcy;0];

Fa = -[0;-m*9.81;0]-Fb;
vpa(Fa)
vpa(Fb)
vpa(Fc)
