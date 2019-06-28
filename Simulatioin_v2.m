%Housekeeping
    clear all; % clear all variables from memory
    close all; % close all figures
    clc; % clear command window

%% case 0
    normalp_case0 = normrnd(0,1,[1,252]);
    normalb_case0 = normrnd(0,1,[1,252]);
    
    ret_p0= 10 + normalp_case0;
    ret_b0 = 10 + normalb_case0;
    
    figure
    plot(ret_b0)
    hold on
    plot(ret_p0)
    hold off
    title('Equal Expected Return and Standard Deviation')
    xlim([0 252])
    xlabel('t')
    ylabel('Return %')
    legend('Benchmark Return','Portfolio Return')
    
%% case 1
    normalp_case1 = normrnd(0,1,[1,252]);
    normalb_case1 = normrnd(0,1,[1,252]);
    
    ret_p1 = 15 + normalp_case1;
    ret_b1 = 10 + normalb_case1;
    
    figure
    plot(ret_b1)
    hold on
    plot(ret_p1)
    hold off
    title('Equal Standard Deviation Different Expected Return')
    xlim([0 252])
    xlabel('t')
    ylabel('Return %')
    legend('Benchmark Return','Portfolio Return')
    
%% case 2

    normalp_case2 = normrnd(0,2,[1,252]);
    normalb_case2 = normrnd(0,1,[1,252]);
    
    ret_p2 = 10 + normalp_case2;
    ret_b2 = 10 + normalb_case2;
    
    figure
    plot(ret_b2)
    hold on
    plot(ret_p2)
    hold off
    title('Equal Expected Return Different Standard Deviation')
    xlim([0 252])
    xlabel('t')
    ylabel('Return %')
    legend('Benchmark Return','Portfolio Return')
    
 %% case 3
 
    normalp_case3 = normrnd(0,1,[1,252]);
    normalb_case3 = pearsrnd(0,1,-1,3,1,252);
    
    ret_p3 = 10 + normalp_case3;
    ret_b3 = 10 + normalb_case3;
    
    figure
    plot(ret_b3)
    hold on
    plot(ret_p3)
    hold off
    title('Different Skewness Same Expected Return & Standard Deviation')
    xlim([0 252])
    xlabel('t')
    ylabel('Return %')
    legend('Benchmark Return','Portfolio Return')
    
 %% case 4
 
    normalp_case4 = normrnd(0,1,[1,252]);
    normalb_case4 = pearsrnd(0,1,0,9,1,252);
    
    ret_p4 = 10 + normalp_case4;
    ret_b4 = 10 + normalb_case4;
    
    figure
    plot(ret_b4)
    hold on
    plot(ret_p4)
    hold off
    title('Different Kurtosis Same Expected Return & Standard Deviation')
    xlim([0 252])
    xlabel('t')
    ylabel('Return %')
    legend('Benchmark Return','Portfolio Return')
    
%% Compute TE 

%case 0
diff0 = ret_p0-ret_b0;
TE0 = std(diff0,1)

%case 1
diff1 = ret_p1-ret_b1;
TE1 = std(diff1,1)

%case 2
diff2 = ret_p2-ret_b2;
TE2 = std(diff2,1)

%case 3
diff3 = ret_p3-ret_b3;
TE3 = std(diff3,1)

%case 4
diff4 = ret_p4-ret_b4;
TE4 = std(diff4,1)



%% compute RMSE-TE

rmse_te0 = (var(diff0)+sum(diff0.^2))^.5
rmse_te1 = (var(diff1)+sum(diff1.^2))^.5
rmse_te2 = (var(diff2)+sum(diff2.^2))^.5
rmse_te3 = (var(diff3)+sum(diff3.^2))^.5
rmse_te4 = (var(diff4)+sum(diff4.^2))^.5

%% Quantiles

%quantiles for evaluation
quants=[0.01 0.025 0.05 0.10 0.25 0.50 0.75 0.90 0.95 0.975 0.99];  

%calculate quantiles for 5 simulated cases
port_quant0=quantile(ret_p0,quants)';
bench_quant0=quantile(ret_b0,quants)';

port_quant1=quantile(ret_p1,quants)';
bench_quant1=quantile(ret_b1,quants)';

port_quant2=quantile(ret_p2,quants)';
bench_quant2=quantile(ret_b2,quants)';

port_quant3=quantile(ret_p3,quants)';
bench_quant3=quantile(ret_b3,quants)';

port_quant4=quantile(ret_p4,quants)';
bench_quant4=quantile(ret_b4,quants)';
    
%% compute QuTE

quant_diff0 = sum((bench_quant0-port_quant0).^2)/11
quant_diff1 = sum((bench_quant1-port_quant1).^2)/11
quant_diff2 = sum((bench_quant2-port_quant2).^2)/11
quant_diff3 = sum((bench_quant3-port_quant3).^2)/11
quant_diff4 = sum((bench_quant4-port_quant4).^2)/11