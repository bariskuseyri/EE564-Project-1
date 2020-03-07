H=(table2array(Steel1008BHcurve(:,1)))';
B=(table2array(Steel1008BHcurve(:,2)))';


plot(H,0.00022368*H)
hold on
plot(H,B)

axis([0 397887 0 1.5])

dy=diff(B)./diff(H);



