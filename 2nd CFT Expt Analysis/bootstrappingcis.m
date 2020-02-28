function [ci_l,ci_u,data_mean] = bootstrappingcis(data_string)
%
% My bootstrapping function.
% "data_mean" is really the percentage correct!
%
% Last updated on 24/05/2019
%
%
%
%
%
%

% Edge correction:
x = data_string;
findzero=x(find(x=='0'));
if findzero>0
    data_string=x;
else
    new_data=x;
    add_zero='0';
    data_string=cat(1,x,new_data,add_zero);
end


% Convert string into a numerical value:
for i=1:length(data_string)
    data(i,1) = str2double(data_string(i));
end

N = 1000; % Number of times to resample data from data
for i=1:N
    y=datasample(data,length(data)); % The resampling function
    p=y(find(y==1));
    per_correct=(length(p)/length(data))*100;
    mean_array(i)=per_correct;
end
% Calculate CIs:
num_1=data(find(data==1));
data_mean=(length(num_1)/length(data))*100;
ci = prctile(mean_array,[2.5 97.5],'all'); % Get the percentiles here!
ci_l=data_mean-ci(1); % Calculate the lower bound confidence interval
ci_u=ci(2)-data_mean; % Calculate the upper bound confidence interval
