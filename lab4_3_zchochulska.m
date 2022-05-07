clc % czysci command window
clear all % zabija zmienne
close all % 

x = [-1,0,2,5,6];
y = [-5,4,-2,19,58];
n = size(x,2);

%  macierz X
X = zeros(3*n-3);

% 2*n-2 
% musi przechodzić przez punkty na końcach przedziału:
for i=1:n-1
    X(2*i-1, 3*i-2:3*i) = [(x(i))^2,x(i),1];
    X(2*i,   3*i-2:3*i) = [(x(i+1))^2,x(i+1),1];
end

% n-2 
% W węzłach nachylenia (pierwsze pochodne) wielomianów z sąsiednich
% przedziałów muszą być jednakowe (nie dotyczy to skrajnych węzłów)
for i=2:n-1
    X(2*n-3+i, 3*i-5:3*i) = [2*x(i),1,0, -2*x(i),-1,0];
end

% 1 rownanie na funkcję liniową w pierwszym przedziale
X(3*n-3, 1) = 1;

%tworzę macierz Y
Y = zeros(3*n-3,1);

% wartosci Y w krancach przedzialow
for i=1:n-1
    Y(2*i-1, 1) = y(i);
    Y(2*i,   1) = y(i+1);
end

% Współczynniki funkcji
A = X\Y

%wyswietlanie
%x = linspace(x(1), x(n));
for i = 1:n-1
    ii = 3*i-2;
    %xx = linspace(x(i), x(i+1), 5);
    %yy = A(ii)*xx.^2 + A(ii+1)*xx + A(ii+2);
    fplot(@(x) A(ii)*x.^2 + A(ii+1)*x + A(ii+2), [x(i), x(i+1)],'Linewidth',1);

    if (i == n-1)
        hold on
        fplot(@(xx) xx.^3 -5*xx.^2 +3*xx + 4, [x(1), x(n)],'--r');
        hold off
        grid
        else
            hold on
    end
end

