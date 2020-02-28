function [pc er total_responses] = secondcf_pairedgrids(which_block,trial_type)
% Main function script to analyse 2nd CF experiment
%
%
% which_block = single blue/orrange or paired blue/orange grids?
% trial_type = what trial pairing are you looking for e.g. O,b?
%
%
%
%
%
%
%
% Last updated: 04/12/19
%
%
%



% What type of tirals are we looking for:
condition = trial_type;



% Determine which paired blue grid trials:
s1 = which_block(:,5);
index_1_paired = find(contains(s1,condition)); % Find a trial type defined by "condition"
% Gather all trials:
for j=1:25
    pairedtrials(j,:) = which_block(index_1_paired(j),:);
end
% Get responses for o1,B1 and calculate correct responses as a percentage::
s2 = pairedtrials(:,3);
num_pc = find(contains(s2,'1'));
num_er = find(contains(s2,'0'));

pc = length(num_pc);
er = length(num_er);
total_responses = s2;

