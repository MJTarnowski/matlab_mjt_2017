function dydt = erk(t,y,params)
k1 = params(1);
k2 = params(2);
k3 = params(3);
k4 = params(4);
k5 = params(5);
k6 = params(6);
k7 = params(7);
k8 = params(8);
k9 = params(9);
k10 = params(10);
k11 = params(11);

dydt = [-k1*y(1)*y(2)+k2*y(3)+k5*y(4);
-k1*y(1)*y(2)+k2*y(3)+k11*y(11);
k1*y(1)*y(2)-k2*y(3)-k3*y(3)*y(9)+k4*y(4);
k3*y(3)*y(9)-k4*y(4)-k5*y(4);
k5*y(4)-k6*y(5)*y(7)+k7*y(8);
k5*y(4)-k9*y(6)*y(10)+k10*y(11);
-k6*y(5)*y(7)+k7*y(8)+k8*y(8);
k6*y(5)*y(7)-k7*y(8)-k8*y(8);
-k3*y(3)*y(9)+k4*y(4)+k8*y(8);
-k9*y(6)*y(10)+k10*y(11)+k11*y(11);
k9*y(6)*y(10)-k10*y(11)-k11*y(11);
];