clc % czysci command window
clear all % zabija zmienne
close all % 

%dana macierz
%A = [6 5 -5; 2, 6, -2; 2, 5, -1];
A = [3, 7; 4, 4]

%do porownania 
[Qt Rt] = qr(A);

[m,n] = size(A);
R=A; %Zaczynam z R = A
Q=eye(m); %Q jako macierz jednostkowa

for k = 1:m-1
    x=zeros(m,1);
    x(k:m,1)=R(k:m,k);
    g=norm(x);
    v=x; 
    v(k)=x(k)+g;
    
    s=norm(v);
    if s~=0, w=v/s; u=2*R'*w;
        R=R-w*u'; %efekt HR
        Q=Q-2*Q*w*w'; %efekt QR
    end
end

disp("Q testowe:")
Qt
disp("Q obliczone:")
Q

disp("R testowe:")
Rt
disp("R obliczone:")
R



