function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    
    yorigin = xorigin + horigin - 1;
    
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    clf();
    
    subplot(3,1,1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Input Signal x(n)", "n", "x(n)");
    xgrid(1);
    
    subplot(3,1,2);
    plot2d3(nh, hn, style=3);
    plot(nh, hn, 'go');
    xtitle("Impulse Response h(n)", "n", "h(n)");
    xgrid(1);
    
    subplot(3,1,3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Convolved Signal y(n) = x(n) * h(n)", "n", "y(n)");
    xgrid(1);
endfunction
