clear all;
minBlad = 100;
minStopien = 0;
    przedzial = linspace(1, 3*pi, 401); 
for stopien = 5 : 18
    figure(1);
    x_punkty = linspace(1, 3*pi, 20); % <--- s�u�y do wyznaczenia w�z��w, a w�z�y s�u�� do wyznaczenia funkcji interpoluj�cej
    y = f1(x_punkty);
    p = polyfit(x_punkty, y, stopien);
    
    yActual = f1(przedzial);
    val = polyval(p, przedzial);
    %% Rysunki
    subplot(5,5,stopien-4);
    plot(przedzial,val,'r');
    hold on;
    plot(x_punkty,y,'ok');
    plot(przedzial,yActual);
    %% wyznaczamy b�ad
    bledy(stopien) = norm(yActual - val,Inf);

end
figure(2)
semilogy(bledy);
minStopien