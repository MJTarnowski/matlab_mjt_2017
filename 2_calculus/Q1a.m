%% root finding problems

%% Q1a
% one method of root finding is interval bisection

% f is the equation for which roots must be found
f = @(x) 3*x + sin(x) - (exp(1))^x;
% a is lower limit and b is upper limit to find root within
a = 0;
b = 1;
err_tol = 1e-7;
% if the y value for each limit have the same sign then a root shouldn't
% fall within the limits (unless the x axis is crossed multiple times over
% this range
if f(a) * f(b) > 0
        disp('root cannot be found within these limits')
    else
        c = (a + b) / 2;
        error = abs(f(c));
        while error > err_tol
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end
            c = (a + b) / 2;
            error = abs(f(c));
        end
end

c

% * note that this code is limited to finding one root*
    
%% my initial attempt - matlab didn't like the way I'd set up functions
%bisection(1,2)
% function output = bisection(a,b)
%     if f(a) * f(b) > 0
%         disp('root cannot be found within these limits')
%     else
%         c = (a + b) / 2;
%         error = abs(f(c));
%         while error > 1e-7
%             if f(a) * f(c) < 0
%                 b = c;
%             else
%                 a = c;
%             end
%             c = (a + b) / 2;
%             error = abs(f(c));
%         end
%     end
% end

%function y = f(x)
%y = 3*x + sin(x) - (exp(1))^x;
%end

%% Q 1b
% another method of root finding is the Newton-Raphson method

