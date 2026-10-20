n = -2:2;
x = [2 3 4 5 6];

xminusn = x($:-1:1);

xe = (x + xminusn) / 2;
xo = (x - xminusn) / 2;

scf(0);
clf();

subplot(3,1,1);
plot2d3(n, x, style=2);
plot(n, x, "bo");
xtitle("Original signal x(n)", "n", "Amplitude");
xgrid(1);

subplot(3,1,2);
plot2d3(n, xe, style=5);
plot(n, xe, "ro");
xtitle("Even component x_e(n)", "n", "Amplitude");
xgrid(1);

subplot(3,1,3);
plot2d3(n, xo, style=3);
plot(n, xo, "go");

a = gca();
a.data_bounds = [min(n), -2.5; max(n), 6.5];

xtitle("Odd component x_o(n)", "n", "Amplitude");
xgrid(1);

disp(x, "x(n) = ");
disp(xe, "x_e(n) = ");
disp(xo, "x_o(n) = ");
