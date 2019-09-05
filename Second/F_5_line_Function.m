function [fitresult, gof] = F_5_line_Function(WD3, JD3)
%CREATEFIT(WD3,JD3)
%  Create a fit.
%  Data for 'untitled fit 1' fit:
%      X Input : WD3
%      Y Output: JD3
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%  另请参阅 FIT, CFIT, SFIT.
%  由 MATLAB 于 20-Aug-2019 10:42:02 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( WD3, JD3 );

% Set up fittype and options.
ft = fittype( 'fourier8' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.717520704729991];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'JD3 vs. WD3', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel WD3
ylabel JD3
grid on


