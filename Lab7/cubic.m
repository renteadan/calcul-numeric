function val = cubic(t, m0, m1, p0, p1)
val = (2*t^3 - 3*t^2 + 1)*p0 + (t^3 - 2*t^2+t)*m0 + (-2*t^3 + 3*t^2)*p1 + (t^3 - t^2)*m1;
end

