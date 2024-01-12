x = [10001; 10002; 10003; 10004; 10005]
z = x - 10002

m = [z.^4 z.^3 z.^2 z.^1 ones(x)]

disp(m)

disp(1/rcond(m))
disp(norm(m,1)*norm(inv(m),1))
