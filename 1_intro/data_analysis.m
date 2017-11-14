%% worksheet 1 - data analysis in matlab

%% Q1 - introductory exercises
%*1(a)* - see file titled my_first_published_matlab_file.m

%*1(b)*
% Write a function which when passed an array will return the mean, the
% median and the mode

% *mean and median function*
% see meanmedian.m file for details

meanmeadian([1 2 3 4])


%% Q2 - simulating experimental noise

% *a(i) a series of random samples of data of increasing size drawn from a
% uniform distribution*

% Calculate the mean and standard deviation of each sample using inbuilt Matlab
% commands, and verify that as the size of the sample increases these two statistics
% tend to their theoretical limit values 

for i = 1:2
    x = 0;
    j = i^2;
    for k = 1:j
        x(k) = randn
        x
        figure
        hist(x,10)
    end
end