function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;

    yorigin = xorigin - k;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    clf();
    
    subplot(2,1,1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Original Signal x(n)", "n", "x(n)");
    xgrid(1);
    
    subplot(2,1,2);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Delayed Signal y(n) = x(n - " + string(k) + ")", "n", "y(n)");
    xgrid(1);
endfunction
