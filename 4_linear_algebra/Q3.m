%% Q3 - solutions of linear systems

%% Q3a - inv computes the inverse of a matrix

%% Q3b - these plot 
A=randn(512);
b=randn(512,1);
tic, x1=inv(A)*b; toc
tic, x2=A\b; toc
plot(x1 - x2)

%really x1 and x2 should be the same because inv(A)*b = A\b
% The backslash calculation is quicker and has less residual error by
% several orders of magnitude. 
% 
% The behavior of this example is typical. Using A\b instead of inv(A)*b is
% two to three times faster, and produces residuals on the order of machine 
% accuracy relative to the magnitude of the data.

clear

%% proof that inv(A)*b = A\b (kinda like b/A)

A = [1:2;3:4]
b = [1;2]
inv(A)*b
A\b

% however the code for Q3b shows that 
% solving a linear system by inverting the matrix using inv(A)*b is inferior to solving it directly using the backslash operator


%% Q3c
%tic starts a timer 
% toc ends the timer

%% Q3d

for n=1:10
    l(n)=2^n;
    A=randn(l(n));
    b=randn(l(n),1);
    tic, x1=inv(A)*b; e1(n)=toc;
    tic, x2=A\b; e2(n)=toc;
end
loglog(l,e1,'rx',l,e2,'go')
xlabel('Matrix size')
ylabel('Elapsed time')
title('Comparison of times to solve a matrix problem using inv and backslash')
legend('inv','backslash')
clear

% this creates a series of random data sets
% of increasing size
% then the two methods are applied (inverse or backslash)
% finally  the time taken for each method and each sample size are plotted

% this shows the efficiency of backslash is greater than that of inverse

