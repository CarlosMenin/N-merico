x = [10001, 10002, 10003, 10004, 10005]
z = x - 10002
A = ones(5,5)
for i = 2:5
    A(i,:) = z.^(i-1)
end

disp(norm(A,%inf)*norm(inv(A),%inf))
