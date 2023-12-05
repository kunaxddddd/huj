clear all;
clc
close all;
%% Zadanie 1b
index = 1;
figure(1);

f2=@(x)(abs(exp(-x)-0.2));

for N = 5 : 25
   x = linspace(1, 3*pi, N);
   y = f2(x);
   coeff = polyfit(x, y, N - 1);
   wezly = polyval(coeff, x);
   
   xDoWykresu = linspace(1, 3*pi, 401);
   
   yRzecz = f2(xDoWykresu);
   yInter = polyval(coeff, xDoWykresu);
   
   subplot(5, 5, N - 4);
   plot(xDoWykresu, yRzecz, 'b');
   hold on;
   plot(xDoWykresu, yInter, 'r');
   plot(x, wezly, 'o');
   
   x2 = linspace(1, 3*pi, 401);
   y2 = f2(x2);
   yInter2 = polyval(polyfit(x2, y2, N - 1), x2);
   
   bledyBezwzg = abs(y2) - abs(yInter2);
   bledy(index) = norm(max(bledyBezwzg));
   index = index + 1;
end

figure(2);
semilogy(bledy);