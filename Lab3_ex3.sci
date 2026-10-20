function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    
    yorigin = length(xn) - xorigin + 1;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    clf();
    
    subplot(2,1,1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Original Signal x(n)", "n", "x(n)");
    xgrid(1);
    
    subplot(2,1,2);
    plot2d3(ny, yn, style=6);
    plot(ny, yn, 'mo');
    xtitle("Folded Signal y(n) = x(-n)", "n", "y(n)");
    xgrid(1);
endfunction
