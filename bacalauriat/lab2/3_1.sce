u = linspace(0, 2*%pi, 20)
v = linspace(0, 8*%pi, 80)

X = (cos(u) .* u)' * (1 + cos(v / 2))
Y = (u / 2)' * sin(v)
Z = (sin(u) .* u)' * (1 + cos(v / 2))
plot3d2(X, Y, Z)
