clear;
clc;
close all

%declare parameters from rubric
omega_t = 2;
K_f = 4*10^-6;
omega_L = 2.5;
omega_mu = 1;
T_max = 72000;
K_L_max = 2.6;
mu_max = 30;
C_D_0 = .0183;
C_L_alpha = .092 * 180/pi;
alpha_0 = -.05 * pi/180;
S_w = 1745;
AR_w = 10.1;
e_eff = .613;
Re = 6371000;
omega_e = 7.292*10^-5;

%declare initial conditions
v_bn_0 = 600;
gamma_0 = 0;
sigma_0 = 0;
h_0 = 20000;
lat_0 = 33.2098 * pi/180;
long_0 = -87.5692 * pi/180;
v_wn_n = [40;40;0];
g0 = 32.17;
rho = 2.3769 * 10^-3;
weight_0 = 200000;

%declare controller variables
KT_p = 0.08;
KT_i = 0.002;
KL_p = 0.5;
KL_i = 0.01;
K_mu_p = 0.075;


sim = sim("OswaldE_Proj2_Sim");
open('OswaldE_Proj2_Sim')

subplot(1,2,1)
plot(time,groundspeed_com)
hold on
plot(time,groundspeed)
plot(time,airspeed)
title("Simplified Simulation")
legend("Commanded Speed", "Groundspeed", "Airspeed", 'Location', 'north')
ylim([400, 700])
subplot(1,2,2)
plot(time,groundspeed_com2)
hold on
sgtitle("Groundspeeds and Airspeed v time")
plot(time,groundspeed2)
plot(time,airspeed2)
title("Complex Simulation")
legend("Commanded Speed", "Groundspeed", "Airspeed", 'Location', 'north')
ylim([400, 700])
hold off

figure(2)
subplot(1,2,1)
plot(time,flight_path_com)
hold on 
plot(time,flight_path)
title("Simplified Simulation")
legend("Commanded Flight Path", "Flight Path Angle", 'Location', 'north')
ylim([-2 6.5])
ylabel("Degrees")
subplot(1,2,2)
plot(time,flight_path_com2) 
hold on
sgtitle("Flight Path Angles")
plot(time,flight_path2)
title("Complex Simulation")
legend("Commanded Flight Path", "Flight Path Angle", 'Location', 'north')
ylim([-2 6.5])
hold off

figure(3)
subplot(1,2,1)
plot(time,heading_com)
hold on
plot(time,heading)
legend("Commanded Heading", "Heading Angle", 'Location', 'north')
ylabel("Degrees")
title("Simplified Simulation")
ylim([0 18])
subplot(1,2,2)
plot(time,heading_com2)
hold on
plot(time,heading2)
sgtitle("Heading Angles")
legend("Commanded Heading", "Heading Angle", 'Location', 'north')
title("Complex Simulation")
ylim([0 18])
hold off

figure(4)
subplot(1,2,1)
plot(time,alpha_com)
hold on
plot(time,alpha)
plot(time,alpha_max)
legend("Commanded AOA", "AOA", "Maximum AOA", 'location', 'northwest')
title("Simplified Simulation")
ylabel("Degrees")
ylim([-2 20])
subplot(1,2,2)
plot(time,alpha_com2)
hold on
plot(time,alpha2)
plot(time,alpha_max2)
sgtitle("Angles of Attack")
legend("Commanded AOA", "AOA", "Maximum AOA", 'location', 'northwest')
title("Complex Simulation")
hold off

figure(5)
subplot(1,2,1)
plot(time,altitude_com)
hold on
plot(time,altitude)
title("Simplified Simulation")
legend("Commanded Altitude", "Altitude", 'Location', 'northwest')
ylabel("Feet")
subplot(1,2,2)
plot(time,altitude_com2)
hold on
plot(time,altitude2)
title("Complex Simulation")
sgtitle("Altitudes")
legend("Commanded Altitude", "Altitude", 'Location', 'northwest')
hold off

figure(6)
subplot(1,2,1)
plot(latitude,longitude)
ylabel("Longitude(Degrees)")
xlabel("Latitude(Degrees)")
title("Simplified Simulation")
subplot(1,2,2)
plot(latitude2,longitude2)
xlabel("Latitude(Degrees)")
title("Complex Simulation")
sgtitle("Longitude v Latitude")

figure(7)
subplot(1,2,1)
plot(time,thrust)
hold on
plot(time,drag)
yline(T_max)
legend("Thrust", "Drag", "Maximum Thrust")
title("Simplified Simulation")
ylabel("Pounds Force")
ylim([0 90000])
subplot(1,2,2)
plot(time,thrust2)
hold on
plot(time,drag2)
yline(T_max)
title("Complex Simulation")
legend("Thrust", "Drag", "Maximum Thrust")
sgtitle("Thrust and Drag")
ylim([0 90000])
hold off

figure(8)
subplot(1,2,1)
plot(time,bank)
hold on
yline(mu_max)
title("Simplified Simulation")
legend("Bank Angle", "Maximum Bank angle")
ylim([0,35])
ylabel("Degrees")
subplot(1,2,2)
plot(time,bank2)
hold on
title("Complex Simulation")
yline(mu_max)
legend("Bank Angle", "Maximum Bank Angle")
sgtitle("Bank Angles")
ylim([0,35])
hold off