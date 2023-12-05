clear all;
clc;
close all;
%% Zadanie 1a
index = 1;
figure(1);
f1=@(x)(exp(1./(sqrt(x+1))).*cos(2*x));

for N = 5 : 25
   x = linspace(1, 3*pi, N);
   y = f1(x);
   coeff = polyfit(x, y, N - 1);
   wezly = polyval(coeff, x);
   
   xDoWykresu = linspace(1, 3*pi, 50);
   
   yRzecz = f1(xDoWykresu);
   yInter = polyval(coeff, xDoWykresu);
   
   subplot(5, 5, N - 4);
   plot(xDoWykresu, yRzecz, 'b');
   hold on;
   plot(xDoWykresu, yInter, 'r');
   plot(x, wezly, 'o');
   
   x2 = linspace(1, 3*pi, 401);
   y2 = f1(x2);
   yInter2 = polyval(polyfit(x2, y2, N - 1), x2);
   
   bledyBezwzg = abs(y2) - abs(yInter2);
   bledy(index) = norm(bledyBezwzg,Inf);
   index = index + 1;
end

figure(3);
semilogy(bledy);