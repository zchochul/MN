clc % czysci command window
clear all % zabija zmienne
close all % 

%średnik nie wypisuje na command window
%whos mówi jakie są zmienne
%mamy 3 typy zmiennych : double, char, logic

disp("siema"); %nfo o tym jest po zaznaczeniu i kliknięciu F1
fprintf("test\n");

kropkowy = 0:1.2:10; %początek:krok:koniec

x = linspace(0, 2*pi, 100); %początek:koniec:na ile dzielimy
element5 = x(5);


A = [1 2 3; 4 5 6];
B = [7, 8, 9; 10, 11, 12];

A(1,1);
A(1:2, 1:2);
A(:, 1:2); % : oznacza, że wszystkie
%A(5,5) = 0.1;



C = eye(2);
zeros(4);
ones(2);
rand(2);

[rzad kol] = size(A);

kropeczka = A .* B %mnożenie element po elemencie

%Funkcja anonimowa
f = @(x) x.^2 + 1;
f(2)

%plot(x,sin(x),x, cos(x));
%plot(x,sin(x), x, sin(x) + rand(1), x, cos(x))

a = repmat([1 2 3], 1, 4);
mean(a(a>1));
