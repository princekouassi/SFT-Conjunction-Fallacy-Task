function [f] = singlegrid_plots(singleblue_results,singleorange_results,sallblue_result,sallorange_result)
%
% Main function to produce plots of the single grid trial results
%
%
%
% Last updated: 07/01/2020
%
%
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get Error Rates for the CF:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ERROR RATES FOR SINGLE BLUE TRIALS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Confidence intervals:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get percentage of error rates for experimental and control trials:
bb_mean_bo = singleblue_results(1,2)/10*100;
bb_mean_Bo = singleblue_results(2,2)/10*100;


% Convert blue paired grid responses to string:
s1 = sallblue_result(:,1); b_strap_bo = num2str(s1);
s2 = sallblue_result(:,2); b_strap_Bo = num2str(s2);


[l1b u1b]=bootstrappingcis(b_strap_bo);
[l2b u2b]=bootstrappingcis(b_strap_Bo);



ci_lb = [l1b l2b]; % calculate lower bound ci
ci_ub = [u1b u2b]; % calculate upper bound ci

y1 = [bb_mean_bo bb_mean_Bo]; % Plot upper and lower bounds based percentage correct
xx = 1:1:2; % the x-axis

% Confidence interval plot of percentage correct
figure(5); ax=axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor','blue')
xlim([0 3]);
ylim([0 101]);
xticks(ax,[1 2]);
xticklabels(ax,{'b,o';'B,o'});
title('ERROR RATES - Single Grids: "more Blue than orange"');
ylabel('Error (%)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ERROR RATES FOR PAIRED Orange TRIALS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Confidence intervals:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get percentage of error rates for experimental and control trials:
oo_mean_ob = singleorange_results(1,2)/10*100;
oo_mean_Ob = singleorange_results(2,2)/10*100;

% Convert blue paired grid responses to string:
s1 = sallorange_result(:,1); o_strap_ob = num2str(s1);
s2 = sallorange_result(:,2); o_strap_Ob = num2str(s2);


[l1o u1o]=bootstrappingcis(o_strap_ob);
[l2o u2o]=bootstrappingcis(o_strap_Ob);


ci_lb = [l1o l2o]; % calculate lower bound ci
ci_ub = [u1o u2o]; % calculate upper bound ci

y1 = [oo_mean_ob oo_mean_Ob]; % Plot upper and lower bounds based percentage correct
xx = 1:1:2; % the x-axis

% Confidence interval plot of percentage correct
figure(6); ax=axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0.9290, 0.6940, 0.1250])
xlim([0 3]);
ylim([0 101]);
xticks(ax,[1 2]);
xticklabels(ax,{'o,b';'O,b'});
title('ERROR RATES - Single Grids: "more Orange than blue"');
ylabel('Error (%)');


f = 'Single grid plots done!';