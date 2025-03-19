A = [4 5 -2; 3 -1 0; 4 2 7]
B = [2 1 -1; 0 1 3; 5 7 3]
D = 3*A^2 - (A + 2*B)*B

D_1 = inv(D)
dim = sqrt(length(D))
for i = 1:dim
    for j = 1:dim
        printf("%f\t", D_1(i + (j-1)*dim))
    end
    printf("\n")
end
printf("\nCheck solution: %s", norm(D*D_1 - eye(dim, dim), 2) < 0.000001)
