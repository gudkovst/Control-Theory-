T0 = 0.88
printf("pi-regulator\n")
Ti = 6.66
K = 1.2825
a6 = T0^5 * Ti
a5 = 5 * T0^4 * Ti
a4 = 10 * T0^3 * Ti
a3 = 10 * T0^2 * Ti
a2 = 5 * T0 * Ti
a1 = Ti + K * Ti
a0 = K
A = [0 0 0 0 0 -a0/a6; 1 0 0 0 0 -a1/a6; 0 1 0 0 0 -a2/a6; 0 0 1 0 0 -a3/a6; 
0 0 0 1 0 -a4/a6; 0 0 0 0 1 -a5/a6]
H = lyap(A, -eye(A), 'c')
s = spec(H)
for i = 1:length(s)
    if s(i) < 0
        printf("Матрица А неустойчива\n")
        break
    end 
end
printf("kappa = %f\n", norm(H, 2))

printf("pid-regulator\n")
Tc = 0.11
Td = 0.94
Ti = 3.4
K = 1.35
a7 = T0^5 * Tc * Ti
a6 = 5 * T0^4 * Tc * Ti + T0^5 * Ti
a5 = 10 * T0^3 * Tc * Ti + 5 * T0^4 * Ti
a4 = 10 * T0^2 * Tc * Ti + 10 * T0^3 * Ti
a3 = 5 * T0 * Tc * Ti + 10 * T0^2 * Ti
a2 = Tc * Ti + 5 * T0 * Ti + K * Ti * Tc + K * Td * Ti
a1 = Ti + K * Ti + K * Tc
a0 = K
A = [0 0 0 0 0 0 -a0/a7; 1 0 0 0 0 0 -a1/a7; 0 1 0 0 0 0 -a2/a7; 
0 0 1 0 0 0 -a3/a7; 0 0 0 1 0 0 -a4/a7; 0 0 0 0 1 0 -a5/a7; 0 0 0 0 0 1 -a6/a7]
H = lyap(A, -eye(A), 'c')
s = spec(H)
for i = 1:length(s)
    if s(i) < 0
        printf("Матрица А неустойчива")
        break
    end    
end
printf("kappa = %f", norm(H, 2))

