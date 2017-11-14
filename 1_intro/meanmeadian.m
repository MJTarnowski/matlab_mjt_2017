function [amean, amedian] = meanmeadian(x)
amean = arraymean(x)
amedian = arraymedian(x)

function [y] = arraymean(x)
n = numel(x);
total = 0;
for k = 1:n
    total = total + x(k);
end
y = total/n;
fprintf('the mean is %f \n',y)
end

% * median function*
function [y] = arraymedian(x)
n = numel(x);
y = x(int8(n/2));
fprintf('the median is %f \n',y)
end

end