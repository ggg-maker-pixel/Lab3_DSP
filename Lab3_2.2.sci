function y = xseq(k)
    y = zeros(1, length(k));

    I1 = find(k >= -1 & k <= 2);
    y(I1) = 1;

    I2 = find(k >= 3 & k <= 4);
    y(I2) = 1/2;
endfunction

function stemplot(n, y, titleText, stemStyle, markerStyle)
    plot2d3(n, y, style=stemStyle);
    plot(n, y, markerStyle);

    a = gca();
    a.data_bounds = [min(n), -0.6; max(n), 1.2];
    a.y_ticks = tlist(["ticks", "locations", "labels"], ...
                      [-0.5; -0.25; 0; 0.25; 0.5; 1], ...
                      ["-0.5"; "-0.25"; "0"; "0.25"; "0.5"; "1"]);

    xtitle(titleText, "n", "Amplitude");
    xgrid(1);
endfunction

n = -6:8;

xa = xseq(n - 2);

xb = xseq(4 - n);

xc = xseq(n + 2);

u2n = zeros(1, length(n));
u2n(find(n <= 2)) = 1;
xd = xseq(n) .* u2n;

delta3 = zeros(1, length(n));
delta3(find(n == 3)) = 1;
xe = xseq(n - 1) .* delta3;

xf = xseq(n .^ 2);

xg = (xseq(n) + xseq(-n)) / 2;

xh = (xseq(n) - xseq(-n)) / 2;

scf(0);
clf();

subplot(4, 2, 1);
stemplot(n, xa, "(a) x(n-2)", 2, "bo");

subplot(4, 2, 2);
stemplot(n, xb, "(b) x(4-n)", 3, "go");

subplot(4, 2, 3);
stemplot(n, xc, "(c) x(n+2)", 4, "mo");

subplot(4, 2, 4);
stemplot(n, xd, "(d) x(n)u(2-n)", 5, "ro");

subplot(4, 2, 5);
stemplot(n, xe, "(e) x(n-1)delta(n-3)", 6, "co");

subplot(4, 2, 6);
stemplot(n, xf, "(f) x(n^2)", 2, "ko");

subplot(4, 2, 7);
stemplot(n, xg, "(g) Even part of x(n)", 3, "bo");

subplot(4, 2, 8);
stemplot(n, xh, "(h) Odd part of x(n)", 5, "ro");
