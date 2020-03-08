H=(table2array(Steel1008BHcurve(:,1)))';
B=(table2array(Steel1008BHcurve(:,2)))';

plot(H,0.0027*H)
hold on
plot(H,0.00022368*H)
hold on
plot(H,B)
title('BH-Curve')
xlabel('H (A/m)')
ylabel('B (T)')

axis([0 397887 0 1.5])

dy=diff(B)./diff(H);



