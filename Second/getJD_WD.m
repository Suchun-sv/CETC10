function [JD, WD] = getJD_WD(t, i)
global m;
global n;
JD = 0;
WD = 0;
traceNum = [100, 100, 100, 10, 10, 10, 10];
num = traceNum(i);
% t, temp = prepareCurveData(t, 0);
switch i
    case 1
        JD_args = n.F_1;
    case 2
        JD_args = n.F_2;
    case 3
        JD_args = n.F_3;
     case 4
        JD_args = n.F_4;
    case 5
        JD_args = n.F_5;
    case 6
        JD_args = n.F_6;
    case 7
        JD_args = n.F_7;         
end

switch i
    case 1
        WD_args = m.F_1;
    case 2
        WD_args = m.F_2;
    case 3
        WD_args = m.F_3;
     case 4
        WD_args = m.F_4;
    case 5
        WD_args = m.F_5;
    case 6
        WD_args = m.F_6;
    case 7
        WD_args = m.F_7;         
end

% m???, n???
%????
for ii = 1:num
    JD = JD + four(t, JD_args(ii));
    WD = WD + four(t, WD_args(ii));
end
JD = JD/num;
WD = WD/num;