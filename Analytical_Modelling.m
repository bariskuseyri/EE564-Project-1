clc
clear all
close all


% Problem constants (in meters)
lgclearance=0.5*10^(-3);    % air-gap clearance
dcore=20*(10^-3);           % core depth
N=250;                      % number of turns
Idc=3;                      % coil current (DC)
u0=4*pi*(10^-7);            % permeability of free space

% Part with lg=0.5mm (long radius)
theta1=2*asind(7.5/12);

% Part with lg=2.5mm (short radius)
theta2=2*asind(7.5/10);

% Part with lg=0.5mm to 2.5mm
theta3=180-(theta1+theta2);

% Active region degrees
y=[];
m=theta1/80;
x=linspace(0,360,360);

for k1 = 1:length(x)
    if (x(k1)>=0)&&(x(k1)<=10)
        y(k1)=theta1;
    elseif (x(k1)>=10)&&(x(k1)<=90)
        y(k1)=theta1-m*(x(k1)-10);
    elseif (x(k1)>=90)&&(x(k1)<=170)
        y(k1)=m*(x(k1)-90);
    elseif (x(k1)>=170)&&(x(k1)<=190)
        y(k1)=theta1;
    elseif (x(k1)>=190)&&(x(k1)<=270)
        y(k1)=theta1-m*(x(k1)-190);
    elseif (x(k1)>=270)&&(x(k1)<=350)
        y(k1)=m*(x(k1)-270);
    else (x(k1)>=350)&&(x(k1)<=360);
        y(k1)=theta1;
    end
end


Aarc1=2*pi*12*(10^-3)*(y/360)*20*(10^-3);             %large air-gap
Aarc2=2*pi*12*(10^-3)*(theta1/360)*20*(10^-3)-Aarc1;    %small air-gap
R1=(2*2.5*(10^-3))./(u0*Aarc1);
R2=(2*0.5*(10^-3))./(u0*Aarc2);

Rtot=((1./R1)+(1./R2)).^(-1);

% Rotational Flux Linkage

F=N*Idc;
Flux=F./Rtot;
FL=Flux.*N;
L=FL./Idc;
L2=(N^2)./Rtot;

W=(1/2)*L*(Idc)^2;
T=diff(W);


subplot(4,1,1)
plot(x,Rtot)
ylabel('Reluctance [1/H]')
subplot(4,1,2)
plot(x,L*1e3)
ylabel('Inductance [mH]')
subplot(4,1,3)
plot(x,W)
ylabel('Energy [W]')
subplot(4,1,4)
plot(x(1:359),T*1e3)
ylabel('Torque [mN.m]')





