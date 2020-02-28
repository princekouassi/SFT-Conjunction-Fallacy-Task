function [f] = pairedgrid_plots(pairedblue_results,pairedorange_results,allblue_result,allorange_result,pairedblue_results_controls,pairedorange_results_controls,allblue_result_controls,allorange_result_controls)
%
% Main function to produce plots of the paired grid trial results
%
%
%
% Last updated: 19/02/2020
%
%
%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAIRED BLUE GRID TRIALS - PLOTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MEAN proportion correct for paired BLUE grids:
pc_pairedblue_EE = (pairedblue_results(1,1)+pairedblue_results(2,1))/50*100;
pc_pairedblue_HH = (pairedblue_results(3,1)+pairedblue_results_controls(1,1)+pairedblue_results_controls(2,1))/51*100;
pc_pairedblue_HE = (pairedblue_results(4,1)+pairedblue_results(5,1))/50*100;
pc_pairedblue_EH = (pairedblue_results(6,1)+pairedblue_results(7,1))/50*100;
b_mean_EE = (pc_pairedblue_EE);
b_mean_HH = (pc_pairedblue_HH);
b_mean_HE = (pc_pairedblue_HE);
b_mean_EH = (pc_pairedblue_EH);

% Get arrays for boot-strapping confidence intervals:
s1 = allblue_result(:,1);s2 = allblue_result(:,2);
s3 = allblue_result(:,3);s4 = allblue_result_controls(:,1);s40 = allblue_result_controls(:,2);
s5 = allblue_result(:,4);s6 = allblue_result(:,5);
s7 = allblue_result(:,6);s8 = allblue_result(:,7);
b_strap_EE1 = cat(1,s1,s2);b_strap_EE = num2str(b_strap_EE1);
b_strap_HH1 = cat(1,s3,s4,s40);b_strap_HH = num2str(b_strap_HH1);
b_strap_HE1 = cat(1,s5,s6);b_strap_HE = num2str(b_strap_HE1); 
b_strap_EH1 = cat(1,s7,s8); b_strap_EH = num2str(b_strap_EH1);


[l1 u1]=bootstrappingcis(b_strap_EH);
[l2 u2]=bootstrappingcis(b_strap_HE);
[l3 u3]=bootstrappingcis(b_strap_EE);
[l4 u4]=bootstrappingcis(b_strap_HH);


ci_lb = [l1 l2 l3 l4]; % calculate lower bound ci
ci_ub = [u1 u2 u3 u4]; % calculate upper bound ci

y1 = [b_mean_EH b_mean_HE b_mean_EE b_mean_HH]; % Plot upper and lower bounds based percentage correct
xx = 1:1:4; % the x-axis

% Confidence interval plot of percentage correct
figure(1); ax = axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor','blue')
xlim([0 5]);
ylim([0 101])
xticks(ax,[1 2 3 4]);
xticklabels(ax,{'E,H';'H,E';'E,E';'H,H'});
title('Proportion Correct - Paired grids: more BLUE than orange"');
ylabel('Mean Correct (%)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAIRED ORANGE GRID TRIALS - PLOTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MEAN proportion correct for paired ORANGE grids:
pc_pairedorange_EE = (pairedorange_results(1,1)+pairedorange_results(2,1))/50*100;
pc_pairedorange_HH = (pairedorange_results(3,1)+pairedorange_results_controls(1,1)+pairedorange_results_controls(2,1))/51*100;
pc_pairedorange_HE = (pairedorange_results(4,1)+pairedorange_results(5,1))/50*100;
pc_pairedorange_EH = (pairedorange_results(6,1)+pairedorange_results(7,1))/50*100;
o_mean_EE = (pc_pairedorange_EE);
o_mean_HH = (pc_pairedorange_HH);
o_mean_HE = (pc_pairedorange_HE);
o_mean_EH = (pc_pairedorange_EH);

% Get arrays for boot-strapping confidence intervals:
s1 = allorange_result(:,1);s2 = allorange_result(:,2);
s3 = allorange_result(:,3);s4 = allorange_result_controls(:,1);s40 = allorange_result_controls(:,2); 
s5 = allorange_result(:,4);s6 = allorange_result(:,5);
s7 = allorange_result(:,6);s8 = allorange_result(:,7);
o_strap_EE1 = cat(1,s1,s2);o_strap_EE = num2str(o_strap_EE1);
o_strap_HH1 = cat(1,s3,s4,s40);o_strap_HH = num2str(o_strap_HH1);
o_strap_HE1 = cat(1,s5,s6);o_strap_HE = num2str(o_strap_HE1); 
o_strap_EH1 = cat(1,s7,s8); o_strap_EH = num2str(o_strap_EH1);


[l4 u4]=bootstrappingcis(o_strap_EE);
[l3 u3]=bootstrappingcis(o_strap_HH);
[l2 u2]=bootstrappingcis(o_strap_HE);
[l1 u1]=bootstrappingcis(o_strap_EH);


ci_lb = [l1, l2, l4, l3]; % calculate lower bound ci
ci_ub = [u1, u2, u4, u3]; % calculate upper bound ci

y1 = [o_mean_EH o_mean_HE o_mean_EE o_mean_HH]; % Plot upper and lower bounds based percentage correct
xx = 1:1:4; % the x-axis

% Confidence interval plot of percentage correct:
figure(2); ax = axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0.9290, 0.6940, 0.1250])
xlim([0 5]);
ylim([0 101]);
xticks(ax,[1 2 3 4]);
xticklabels(ax,{'E,H';'H,E';'E,E';'H,H'});
title('Proportion Correct - Paired grids: "more Orange than blue"');
ylabel(' Mean Correct (%)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% "SFT" PAIRED GRID TRIALS COLLASPED OVER COLOUR PLOTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MEAN proportion correct for paired gridsin SFT trial type:
pc_paired_EE = (pairedorange_results(1,1)+pairedorange_results(2,1)+pairedblue_results(1,1)+pairedblue_results(2,1))/100*100;
pc_paired_HH = (pairedorange_results(3,1)+pairedorange_results_controls(1,1)+pairedorange_results_controls(2,1)+pairedblue_results(3,1)+pairedblue_results_controls(1,1)+pairedblue_results_controls(2,1))/100*102;
pc_paired_HE = (pairedorange_results(4,1)+pairedorange_results(5,1)+pairedblue_results(4,1)+pairedblue_results(5,1))/100*100;
pc_paired_EH = (pairedorange_results(6,1)+pairedorange_results(7,1)+pairedblue_results(6,1)+pairedblue_results(7,1))/100*100;
mean_EE = (pc_paired_EE);
mean_HH = (pc_paired_HH);
mean_HE = (pc_paired_HE);
mean_EH = (pc_paired_EH);

% Get arrays for boot-strapping confidence intervals:
s1 = allorange_result(:,1);s2 = allorange_result(:,2); s3 = allblue_result(:,1);s4 = allblue_result(:,2);
s5 = allorange_result(:,3);s6 = allorange_result_controls(:,1);s60 = allorange_result_controls(:,2);s7 = allblue_result(:,3);s8 = allblue_result_controls(:,1);s80 = allblue_result_controls(:,2); 
s9 = allorange_result(:,4);s10 = allorange_result(:,5); s11 = allblue_result(:,4);s12 = allblue_result(:,5);
s13 = allorange_result(:,6);s14 = allorange_result(:,7); s15 = allblue_result(:,6);s16 = allblue_result(:,7); 
strap_EE1 = cat(1,s1,s2,s3,s4);strap_EE = num2str(strap_EE1);
strap_HH1 = cat(1,s5,s6,s60,s7,s8,s80);strap_HH = num2str(strap_HH1);
strap_HE1 = cat(1,s9,s10,s11,s12);strap_HE = num2str(strap_HE1); 
strap_EH1 = cat(1,s13,s14,s15,s16); strap_EH = num2str(strap_EH1);

[l1 u1]=bootstrappingcis(strap_EE);
[l2 u2]=bootstrappingcis(strap_HH);
[l3 u3]=bootstrappingcis(strap_HE);
[l4 u4]=bootstrappingcis(strap_EH);


ci_lb = [l4 l3 l1 l2]; % calculate lower bound ci
ci_ub = [u4 u3 u1 u2]; % calculate upper bound ci

y1 = [mean_EH mean_HE mean_EE mean_HH]; % Plot upper and lower bounds based percentage correct
xx = 1:1:4; % the x-axis

% Confidence interval plot of percentage correct:
figure(7); ax = axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor','k')
xlim([0 5]);
ylim([0 101]);
xticks(ax,[1 2 3 4]);
xticklabels(ax,{'E,H';'H,E';'E,E';'H,H'});
title('SFT Proportion Correct - Paired Grids Collasped Over Colour');
ylabel(' Mean Correct (%)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get Error Rates for the CF:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ERROR RATES FOR PAIRED BLUE TRIALS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Confidence intervals:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get percentage of error rates for experimental and control trials:
bb_mean_oB = pairedblue_results(5,2)/25*100;
bb_mean_Bo = pairedblue_results(6,2)/25*100;
bb_mean_bB = pairedblue_results(4,2)/25*100;
bb_mean_Bb = pairedblue_results(7,2)/25*100;

% Convert blue paired grid responses to string:
s1 = allblue_result(:,5); b_strap_oB = num2str(s1);
s2 = allblue_result(:,6); b_strap_Bo = num2str(s2);
s3 = allblue_result(:,4); b_strap_bB = num2str(s3);
s4 = allblue_result(:,7); b_strap_Bb = num2str(s4);

[l1b u1b]=bootstrappingcis(b_strap_oB);
[l2b u2b]=bootstrappingcis(b_strap_Bo);
[l3b u3b]=bootstrappingcis(b_strap_bB);
[l4b u4b]=bootstrappingcis(b_strap_Bb);


ci_lb = [l1b l2b l3b l4b]; % calculate lower bound ci
ci_ub = [u1b u2b u3b u4b]; % calculate upper bound ci

y1 = [bb_mean_oB bb_mean_Bo bb_mean_bB bb_mean_Bb]; % Plot upper and lower bounds based percentage correct
xx = 1:1:4; % the x-axis

% Confidence interval plot of percentage correct
figure(3); ax=axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor','blue')
xlim([0 5]);
ylim([0 101]);
xticks(ax,[1 2 3 4]);
xticklabels(ax,{'o,B';'B,o';'b,B';'B,b'});
title('ERROR RATES - Paired Grids: "more Blue than orange in both grids"');
ylabel('Error (%)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ERROR RATES FOR PAIRED ORANGE TRIALS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Confidence intervals:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get percentage of error rates for experimental and control trials:
oo_mean_Ob = pairedorange_results(6,2)/25*100;
oo_mean_bO = pairedorange_results(4,2)/25*100;
oo_mean_Oo = pairedorange_results(7,2)/25*100;
oo_mean_oO = pairedorange_results(5,2)/25*100;

% Convert blue paired grid responses to string:
s1 = allorange_result(:,6); o_strap_Ob = num2str(s1);
s2 = allorange_result(:,4); o_strap_bO = num2str(s2);
s3 = allorange_result(:,7); o_strap_Oo = num2str(s3);
s4 = allorange_result(:,5); o_strap_oO = num2str(s4);


[l1o u1o]=bootstrappingcis(o_strap_Ob);
[l2o u2o]=bootstrappingcis(o_strap_bO);
[l3o u3o]=bootstrappingcis(o_strap_Oo);
[l4o u4o]=bootstrappingcis(o_strap_oO);


ci_lb = [l1o l2o l3o l4o]; % calculate lower bound ci
ci_ub = [u1o u2o u3o u4o]; % calculate upper bound ci

y1 = [oo_mean_Ob oo_mean_bO oo_mean_Oo oo_mean_oO]; % Plot upper and lower bounds based percentage correct
xx = 1:1:4; % the x-axis

% Confidence interval plot of percentage correct
figure(4); ax=axes;
errorbar(xx,y1,ci_lb,ci_ub,'o','MarkerSize',9,...
    'MarkerEdgeColor','k','MarkerFaceColor',[0.9290, 0.6940, 0.1250])
xlim([0 5]);
ylim([0 101]);
xticks(ax,[1 2 3 4]);
xticklabels(ax,{'O,b';'b,O';'O,o';'o,O'});
title('ERROR RATES - Paired Grids: "more Orange than blue in both grids"');
ylabel('Error (%)');


f = 'Paired grid plots done!';