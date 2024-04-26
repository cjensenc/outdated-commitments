% Computes unconditional losses for first example, different values of J
% clear

beta=.99;
rho=.9;
sigma=1;

omegamin=.0000001;
omegamax=32-.05;
alphamin=.0000001;
alphamax=.37-.0005;


% Ld=((omega*(omega+alpha^2)*sigma^2)/((-omega+omega*beta^J*rho^J-alpha^2)^2*(1-rho^2)*(1-beta)))
% r=sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)
% Lc=((alpha^2*rho^J*r-2*beta^J*alpha^2*omega-3*omega*rho^J*alpha^2+2*omega*rho^J*r-2*omega*r+2*omega^2*beta^J*rho^J-2*omega^2*rho^J+2*alpha^2*omega-2*beta^J*omega^2+2*omega^2-alpha^2*omega*beta^J*rho^J-alpha^4*rho^J)*8*omega^3*beta^(2*J)*sigma^2)/((beta^(2*J)*omega^2-2*beta^J*alpha^2*omega+beta^J*omega*r-omega^2-2*alpha^2*omega+omega*r-alpha^4+alpha^2*r)*(rho^2-1)*(beta-1)*(-beta^J*omega-omega-alpha^2-r+2*omega*beta^J*rho^J)^2*(-2*beta^J*omega+omega*beta^J*rho^J+rho^J*omega+rho^J*alpha^2-rho^J*r))
% Lc=((alpha^2*rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-2*beta^J*alpha^2*omega-3*omega*rho^J*alpha^2+2*omega*rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-2*omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)+2*omega^2*beta^J*rho^J-2*omega^2*rho^J+2*alpha^2*omega-2*beta^J*omega^2+2*omega^2-alpha^2*omega*beta^J*rho^J-alpha^4*rho^J)*8*omega^3*beta^(2*J)*sigma^2)/((beta^(2*J)*omega^2-2*beta^J*alpha^2*omega+beta^J*omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-omega^2-2*alpha^2*omega+omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-alpha^4+alpha^2*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2))*(rho^2-1)*(beta-1)*(-beta^J*omega-omega-alpha^2-sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)+2*omega*beta^J*rho^J)^2*(-2*beta^J*omega+omega*beta^J*rho^J+rho^J*omega+rho^J*alpha^2-rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)))
% 
% ratio=((alpha^2*rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-2*beta^J*alpha^2*omega-3*omega*rho^J*alpha^2+2*omega*rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-2*omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)+2*omega^2*beta^J*rho^J-2*omega^2*rho^J+2*alpha^2*omega-2*beta^J*omega^2+2*omega^2-alpha^2*omega*beta^J*rho^J-alpha^4*rho^J)*8*omega^3*beta^(2*J)*sigma^2)/((beta^(2*J)*omega^2-2*beta^J*alpha^2*omega+beta^J*omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-omega^2-2*alpha^2*omega+omega*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)-alpha^4+alpha^2*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2))*(rho^2-1)*(beta-1)*(-beta^J*omega-omega-alpha^2-sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)+2*omega*beta^J*rho^J)^2*(-2*beta^J*omega+omega*beta^J*rho^J+rho^J*omega+rho^J*alpha^2-rho^J*sqrt(beta^(2*J)*omega^2+2*beta^J*alpha^2*omega-2*beta^J*omega^2+alpha^4+2*alpha^2*omega+omega^2)))/((omega*(omega+alpha^2)*sigma^2)/((-omega+omega*beta^J*rho^J-alpha^2)^2*(1-rho^2)*(1-beta)))

warning off;


figure('Color','b');

hold on;

for J=[1:8 12 16 32]

    ezplot(@(omega, alpha) Commitment1JFun(J, omega, alpha, beta, rho, sigma)-1, [omegamin,omegamax, alphamin,alphamax]);

end

axis([-.2 30 -.01 .35]);
set(gca,'YTick',[.05 .1 .15 .2 .25 .3 .35],'YTickLabel',{'.05', '.10', '.15', '.20', '.25', '.30', '.35'})
centeraxes(gca);
%xlabel('\omega','FontSize',50);
%ylabel('\alpha','rot',0,'FontSize',50);
title('')

text(32.3,.049,'J=1','FontSize',11,'color','b');
text(32.3,.102,'J=2','FontSize',11,'color','b');
text(32.3,.152,'J=3','FontSize',11,'color','b');
text(32.3,.203,'J=4','FontSize',11,'color','b');
text(32.3,.254,'J=5','FontSize',11,'color','b');
text(32.3,.305,'J=6','FontSize',11,'color','b');
text(32.3,.355,'J=7','FontSize',11,'color','b');
text(26.7,.37,'J=8','FontSize',11,'color','b');
text(11.8,.37,'J=12','FontSize',11,'color','b');
text(6.8,.37,'J=16','FontSize',11,'color','b');
text(1.75,.37,'J=32','FontSize',11,'color','b');

hold off;
warning on;