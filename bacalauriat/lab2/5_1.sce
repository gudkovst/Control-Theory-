function [zr] = V(c, s)
    zr = s(2) - c(1) * s(1)^c(2) * %e^(c(3) * s(1))
endfunction

s = 0.2:0.5:3.2
v = [2.3198 2.8569 3.5999 4.4357 5.5781 6.9459 8.6621]
z = [s; v]
c = [0; 0; 0; 0; 0; 0; 0]
[a, err] = datafit(V, z, c)

printf("err = %f\n", err)
printf("V(s) = %f * s^(%f) * e^(%f * s)", a(1), a(2), a(3))
plot2d(s, v, -4)
t = 0.2:0.01:3.2
F = a(1) .* t.^a(2) .* %e^(a(3) .* t)
plot2d(t, F)
