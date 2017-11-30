for i=1:5
    for j=1:5
        a(i,j) = i*j;
    end
end

contourf(a)
colorbar