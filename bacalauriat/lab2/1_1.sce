A = [1 2 3 4; 2 1 2 3; 3 2 1 2; 4 3 2 1]
b = [5; 1; 1; -5]

x = linsolve(A, -b)
printf("x = %f\n", x)
ax = A * x
eps = 0.0000001
printf("Solution tested: %s\n", norm(ax - b, 2) < eps)
