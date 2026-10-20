function y = xseq(m)
    y = zeros(1, length(m));

    I1 = find(m >= -3 & m <= -1);
    y(I1) = 1 + m(I1)/3;

    I2 = find(m >= 0 & m <= 3);
    y(I2) = 1;
endfunction

n = -10:10;

x  = xseq(n);
xb1 = xseq(4 - n);
xb2 = xseq(-n - 4);
xc  = xseq(-n + 4);

scf(0); clf();

subplot(2,2,1);
plot2d3(n, x);
xtitle("x(n)", "n", "x(n)");

subplot(2,2,2);
plot2d3(n, xb1);
xtitle("Fold then delay by 4: x(4-n)", "n", "Amplitude");

subplot(2,2,3);
plot2d3(n, xb2);
xtitle("Delay by 4 then fold: x(-n-4)", "n", "Amplitude");

subplot(2,2,4);
plot2d3(n, xc);
xtitle("x(-n+4)", "n", "Amplitude");
