for N = 5 : 25
   x = linspace(1, 3*pi, N); % <--- wêzly
   xx = linspace(1, 3*pi, 401); % <-- punkty które chcê uzyskaæ
   y = f1(x);
   
   yy = spline(x, y, xx);
   yVals = f1(xx);
   
   bledy(N - 4) = norm(max(abs(yVals) - abs(yy)));
end

semilogy(bledy);