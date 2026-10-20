function y = pulse(n, a, b)
    y = zeros(1, length(n));
    I = find(n >= a & n <= b);
    y(I) = 1;
endfunction

function stemplot(n, y, titleText, ymin, ymax)
    plot2d3(n, y, style=5);
    plot(n, y, "bo");

    a = gca();
    a.data_bounds = [min(n), ymin; max(n), ymax];

    xtitle(titleText, "n", "Amplitude");
    xgrid(1);
endfunction

n = -6:8;

x = pulse(n, 0, 3);

//
// (b) System: y(n) = x(n^2)
//

// y(n) = x(n^2)
y_square = pulse(n .^ 2, 0, 3);

// y'(n) = y(n-2) = x((n-2)^2)
y_square_delay = pulse((n - 2) .^ 2, 0, 3);

// x2(n) = x(n-2)
x2 = pulse(n, 2, 5);

// y2(n) = x2(n^2)
y2_square = pulse(n .^ 2, 2, 5);

scf(0);
clf();

subplot(3, 2, 1);
stemplot(n, x, "x(n)", -0.2, 1.2);

subplot(3, 2, 2);
stemplot(n, y_square, "y(n) = x(n^2)", -0.2, 1.2);

subplot(3, 2, 3);
stemplot(n, y_square_delay, "y(n-2)", -0.2, 1.2);

subplot(3, 2, 4);
stemplot(n, x2, "x_2(n) = x(n-2)", -0.2, 1.2);

subplot(3, 2, 5);
stemplot(n, y2_square, "y_2(n) = x_2(n^2)", -0.2, 1.2);

//
// (c) System: y(n) = x(n) - x(n-1)
//

y_diff = pulse(n, 0, 3) - pulse(n - 1, 0, 3);
y_diff_delay = pulse(n - 2, 0, 3) - pulse(n - 3, 0, 3);

y2_diff = pulse(n, 2, 5) - pulse(n - 1, 2, 5);

scf(1);
clf();

subplot(2, 2, 1);
stemplot(n, y_diff, "y(n) = x(n)-x(n-1)", -1.2, 1.2);

subplot(2, 2, 2);
stemplot(n, y_diff_delay, "y(n-2)", -1.2, 1.2);

subplot(2, 2, 3);
stemplot(n, y2_diff, "y_2(n) = x_2(n)-x_2(n-1)", -1.2, 1.2);

//
// (d) System: y(n) = n x(n)
//

// y(n) = n x(n)
y_mult = n .* x;

// y(n-2) = (n-2)x(n-2)
y_mult_delay = (n - 2) .* pulse(n - 2, 0, 3);

// y2(n) = n x2(n)
y2_mult = n .* x2;

scf(2);
clf();

subplot(2, 2, 1);
stemplot(n, y_mult, "y(n) = n x(n)", -0.5, 5.5);

subplot(2, 2, 2);
stemplot(n, y_mult_delay, "y(n-2)", -0.5, 5.5);

subplot(2, 2, 3);
stemplot(n, y2_mult, "y_2(n) = n x_2(n)", -0.5, 5.5);
