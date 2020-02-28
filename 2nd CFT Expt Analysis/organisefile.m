function [single_blue,single_orange,paired_blue,paired_orange] = organisefile(data)
%
% This is the function to organise the raw text file results by grid type
% and colour.
%
%
%
%
% Last updated: 10/12/2019
%
%


% determine which colour block was shown first:
A = data.data(1:40,1); % call A the data_matrix in the matlab function
A = string(A);

% Determine which trials are the blue or orange single grids:
x = find(A=='1'); % Find blue coloured trials
if length(x) > 2 % Check if the first set of single grids are BLUE
    single_blue1 = data.textdata(2:41,:);
    single_orange1 = data.textdata(243:282,:);
    paired_blue1 = data.textdata(42:242,:);
    paired_orange1 = data.textdata(283:483,:);
else
    single_blue1 = data.textdata(243:282,:);
    single_orange1 = data.textdata(2:41,:);
    paired_blue1 = data.textdata(283:483,:);
    paired_orange1 = data.textdata(42:242,:);
end

single_blue = string(single_blue1);
single_orange = string(single_orange1);
paired_blue = string(paired_blue1);
paired_orange = string(paired_orange1);


