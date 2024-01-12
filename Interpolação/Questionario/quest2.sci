x = [10001; 10002; 10003; 10004; 10005]


m = [x.^4 x.^3 x.^2 x.^1 ones(x)]

disp(1/rcond(m))
disp(norm(m,1)*norm(inv(m),1))
