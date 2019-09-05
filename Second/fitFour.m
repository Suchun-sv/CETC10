% Set up fittype and options.
ft = fittype( 'fourier9' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.717520704729991];
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );