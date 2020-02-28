% Main script to analyse 2nd CF experiment
%
%
%
%
% Last updated: 14/02/19 
%
%
%

clear all;
close all;

% Read the text file to orangise things by grid type and colour:
data = importdata('p1.txt'); % Determine which participant we are looking at
[single_blue,single_orange,paired_blue,paired_orange] = organisefile(data); % Organise the data file

% Define the trial types we are interested in for PAIRED grids:
trial_type_blue = ['B1,B1';'O1,B1';'b1,b1';'b1,B1';'o1,B1';'B1,o1';'B1,b1'];
trial_type_orange = ['B1,O1';'O1,O1';'o1,o1';'b1,O1';'o1,O1';'O1,b1';'O1,o1'];
trial_type_controls = ['b1,o1';'o1,b1'];
all_trial_types = cat(1,trial_type_blue,trial_type_orange);

% Define the trial types we are interested in for SINGLE grids:
strial_type_blue = ['b,o';'B,o'];
strial_type_orange = ['o,b';'O,b'];
all_strial_types = cat(1,strial_type_blue,strial_type_orange);

% Create a holding matrix for PAIRED grids:
pairedblue_results = zeros(7,2);
allblue_result = zeros(25,7);
pairedorange_results = zeros(7,2);
allorange_result = zeros(25,7);

% Create a holding matrix for CONTROL PAIRED grids:
pairedblue_results_controls = zeros(2,2);
allblue_result_controls = zeros(13,2);
pairedorange_results_controls = zeros(2,2);
allorange_result_controls = zeros(13,2);

% Create a holding matrix for SINGLE grids:
singleblue_results = zeros(2,2);
sallblue_result = zeros(10,2);
singleorange_results = zeros(2,2);
sallorange_result = zeros(10,2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    PAIRED GRIDS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION TO CALUTATE NUMBER OF CORRECT AND INCOORECT RESPONSES PER TIRAL TYPE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j = 1:2
    if j == 1
        for i = 1:7
            [pc, er, total_responses] = secondcf_pairedgrids(paired_blue,trial_type_blue(i,1:5));
            pairedblue_results(i,1) = pc;
            pairedblue_results(i,2) = er;
            allblue_result(:,i) = total_responses;
        end
    else
        for r = 1:7
            [pc, er, total_responses] = secondcf_pairedgrids(paired_orange,trial_type_orange(r,1:5));
            pairedorange_results(r,1) = pc;
            pairedorange_results(r,2) = er;
            allorange_result(:,r) = total_responses;
        end
    end
        
end

% Run the above loop but now for the extra control trial conditions:
for i = 1:2
    [pc, er, total_responses] = secondcf_pairedgrids_controls(paired_blue,trial_type_controls(i,1:5));
    pairedblue_results_controls(i,1) = pc;
    pairedblue_results_controls(i,2) = er;
    allblue_result_controls(:,i) = total_responses;

    [pc, er, total_responses] = secondcf_pairedgrids_controls(paired_orange,trial_type_controls(i,1:5));
    pairedorange_results_controls(i,1) = pc;
    pairedorange_results_controls(i,2) = er;
    allorange_result_controls(:,i) = total_responses;
end


% Save paired grid data in one location, with more detail:
%pairedgrid_data = struct('Trial_type',all_trial_types,'Number_of_correct_trials', paired_results(:,1),'Number_of_incorrect_trials', paired_results(:,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT PAIRED GRID RESULTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[f] = pairedgrid_plots(pairedblue_results,pairedorange_results,allblue_result,allorange_result,pairedblue_results_controls,pairedorange_results_controls,allblue_result_controls,allorange_result_controls);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    SINGLE GRIDS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION TO CALUTATE NUMBER OF CORRECT AND INCOORECT RESPONSES PER TIRAL TYPE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for j = 1:2
    if j == 1
        for i = 1:2
            [pc, er, total_responses] = secondcf_singlegrids(single_blue,strial_type_blue(i,1:3));
            singleblue_results(i,1) = pc;
            singleblue_results(i,2) = er;
            sallblue_result(:,i) = total_responses;
        end
    else
        for r = 1:2
            [pc, er, total_responses] = secondcf_singlegrids(single_orange,strial_type_orange(r,1:3));
            singleorange_results(r,1) = pc;
            singleorange_results(r,2) = er;
            sallorange_result(:,r) = total_responses;
        end
    end
        
end

% Save paired grid data in one location, with more detail:
%pairedgrid_data = struct('Trial_type',all_trial_types,'Number_of_correct_trials', paired_results(:,1),'Number_of_incorrect_trials', paired_results(:,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT SINGLE GRID RESULTS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[f] = singlegrid_plots(singleblue_results,singleorange_results,sallblue_result,sallorange_result);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%