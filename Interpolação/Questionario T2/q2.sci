x = [10001, 10002, 10003, 10004, 10005]
A = ones(5,5)
for i = 2:5
    A(i,:) = x.^(i-1)
end

disp(1/rcond(A))
