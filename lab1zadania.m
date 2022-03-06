clc % czysci command window
clear all % zabija zmienne
close all %

%zad1
f =  @(x) 1./(exp(-(15-x)/2))
x=1:5;
f(x);

%zad2
y=linspace(0,100,500);
%plot(y, sin(y.^2)/2)

%zad3
A = 1:1:10;
b1 = sum(mod(A,2) .* A)
