% Plik test1.m
clc % czysci command window
clear all % zabija zmienne
close all % 

x = 1-2*rand()
if (x < 0)
        disp('wylosowana liczba jest ujemna!')
elseif (x > 0)
        disp('wylosowana liczba jest dodatnia!')
else
        disp('wylosowana liczba jest rowna zero!')
end