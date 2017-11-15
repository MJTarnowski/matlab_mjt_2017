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

for i = 1:5
    x = 0;
    for j = i.^10
        for k = 1:j
            x(k) = randn;
            % change the above to rand to see it for a uniform distribution
        end
        fprintf(' *** \n sample size: \t\t %d \n mean: \t\t\t %d \n standard deviation \t %d \n *** \n ',j, mean(x), std(x))
%        figure
%        hist(x,10) 
% if you want to see the distributions for each sample size then un-comment the above two lines
% of code
    end
        
end

% for a uniform distribution, as the sample size increases, the mean and
% standard deviation converge to their theoretical limit values: the centre of
% the normal distribution for the mean and to the width of the distribution
% for the standard deviation

% for a uniform distribution, the mean converges to the middle of the
% uniform range 


%% Q2b

% Generate and plot the data ((x, y) coordinates) for a simple straight line of the form
% y = ax + b where a and b are constants and x ∈ [0, 1].


a = 3;
b = 4;
x = 0:1;
y = a*x + b;
%plot(x,y)

%% Q2c

% Generate random errors from a normal distribution with zero mean µ and standard
% deviation σ using built-in Matlab commands, and add these to each of the ycoordinates
% in part (b). Plot these values as points on the same graph as in part (b).
% What happens if µ is non-zero?

% R = normrnd(mu,sigma [matrix size m,n])

%let us let mu = 0 and sigma = 1.. and create a matrix of equal size to the
%number of x values:

R = normrnd(0,1,[1,10])
a = 3;
b = 4;
x = 1:10;
y = a*(x+R) + b;
p = polyfit(x,y,1)
l = polyval(p,x);

% %now to plot the graph
% %figure
% %plot(x,y,'x')
% hold on
% %this retains the current axes so that new plots added to the axes do not
% %delete existing plots
% 
% plot(x,y)
% plot(x,l,'r--')
% legend('y','y(x)','polyfit')
% xlabel('x')
% ylabel('y')
% % * if the mean of the random errors is non zero then the resulting graph 
% % is skewed in the direction of
% % the sign of x (positive or negative))

%% 2(e) - see above

%% 2(f) - as standard deviation increases, estimation of the gradient is good but estimation of b becomes poor much faster

%% 2(g-i) skipped

%% 3(a) - fourier analysis
% fourier analysis is used to look at systems in the frequency domain
% rather than the time domain
% apply FT to evaluate freq domain
% useful in signal processing and image analysis
% first col: time
% second col: applied potential (linear ramp + sin(t)
% thirfd col: resulting current which flows in EC cell due to this applied potential 


data = load('ac.dat')
[r,c] = size(data)
% this shows the number of rows and columns in the data
% create a time vector, t containing integers from 1 to the number of rows,
% r

t = 1:r;
%reset the figure
figure
%plot the data against time
plot(t,data)

%% 3(b) - FFT
% examine the current - this is in the third column

F = fft(data(:,3))
figure
plot(200:3800,F(200:3800))
pxx = periodogram(F)
t1 = 1:4096
figure
plot(t1,pxx)