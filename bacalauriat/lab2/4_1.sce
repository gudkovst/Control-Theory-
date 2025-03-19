a1 = [5 -63 -9.25 0 2]
a2 = [2 -21 0 3]

p1 = poly(a1, 'x', 'c')
p2 = poly(a2, 'x', 'c')
printf("Roots of p1:\n")
printf("%f\n", roots(p1))
printf("\nRoots of p2:\n")
printf("%f\n", roots(p2)) 
