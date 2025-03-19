T0 = 0.88
printf("pi-regulator\n")
Ti = 6.66
K = 1.2825

s = poly(0, 's')
W = 1 / ((1 + s*T0)^5 * Ti*s + K*Ti*s + K)
Sys = syslin('c', W)
h = 0.1
Sysd = dscr(Sys, h)
Ad = Sysd(2)
H = lyap(Ad, -eye(Ad), 'd')
s = spec(H)
for i = 1:length(s)
    if s(i) < 0
        printf("Матрица А неустойчива\n")
        break
    end 
end
printf("kappa = %f\n", h*norm(H, 2))


printf("pid-regulator\n")
Tc = 0.11
Td = 0.94
Ti = 3.4
K = 1.35
s = poly(0, 's')
W = 1 / ((1 + s*T0)^5 * (Tc*Ti*s^2 + Ti*s) + K*(Ti*s + Ti*Tc*s^2 + Td*Ti*s^2 + 1))
Sys = syslin('c', W)
h = 0.1
Sysd = dscr(Sys, h)
Ad = Sysd(2)
H = lyap(Ad, -eye(Ad), 'd')
s = spec(H)
for i = 1:length(s)
    if s(i) < 0
        printf("Матрица А неустойчива\n")
        break
    end 
end
printf("kappa = %f", h*norm(H, 2))
