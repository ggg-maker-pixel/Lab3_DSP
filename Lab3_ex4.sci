function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1_min = 1 - x1origin;
    n1_max = length(x1n) - x1origin;
    
    n2_min = 1 - x2origin;
    n2_max = length(x2n) - x2origin;
    
    n_min = min(n1_min, n2_min);
    n_max = max(n1_max, n2_max);
    ny = n_min:n_max;
    
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    
    y1((n1_min - n_min + 1) : (n1_max - n_min + 1)) = x1n;
    y2((n2_min - n_min + 1) : (n2_max - n_min + 1)) = x2n;
    
    yn = y1 + y2;
    
    yorigin = 1 - n_min;

    clf();
    
    subplot(3,1,1);
    plot2d3(ny, y1, style=2);
    plot(ny, y1, 'bo');
    xtitle("Signal x1(n)", "n", "x1(n)");
    xgrid(1);
    
    subplot(3,1,2);
    plot2d3(ny, y2, style=3);
    plot(ny, y2, 'go');
    xtitle("Signal x2(n)", "n", "x2(n)");
    xgrid(1);
    
    subplot(3,1,3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Added Signal y(n) = x1(n) + x2(n)", "n", "y(n)");
    xgrid(1);
endfunction
