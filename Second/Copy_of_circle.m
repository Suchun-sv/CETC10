traceNum = [100, 100, 100, 10, 10, 10, 10];
for i = 1:7
    root = strcat("data/", int2str(i) );
    root = strcat(root, "/");
%     disp(root)
%     parrent = struct();
    if i ~= 0
        clear parrent;
    end
    for j = 1:traceNum(i)
        fileName = strcat(root, int2str(j) );
        fileName = strcat(fileName, ".csv");
        trace = csvread(fileName);
        [xData, yData] = prepareCurveData( trace(:,1), trace(:,3) );
        fitFour;
        copyargs;
        parrent(j) = a; 
    end
    switch i
        case 1
            n.F_1 = parrent;
        case 2
            n.F_2 = parrent;
        case 3
            n.F_3 = parrent;
         case 4
            n.F_4 = parrent;
        case 5
            n.F_5 = parrent;
        case 6
            n.F_6 = parrent;
        case 7
            n.F_7 = parrent;          
    end
end