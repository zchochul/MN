clc % czysci command window
clear all % zabija zmienne
close all % 

h_c = 40;
P = 0.0157;
k = 240;
A_c = 1.964 * power(10, -5);
L = 0.5;
T_0 = 473;
T_L = 293;
T_s = 293;
Beta = h_c*P/k/A_c;


rozmiar = 20;
h = L/(rozmiar+1);

for i=1:rozmiar
    for j = 1:rozmiar
        if(i==j)
            A(i, j) = -(2+power(h,2)*Beta);
        end
        if(abs(i-j)==1)
            A(i,j) = 1;
        end
    end
end
A

B = repmat(-power(h,2)*Beta*T_s,rozmiar,1);
B(1,1) = -(power(h,2)*Beta*T_s + T_0);
B(rozmiar, 1) = -(power(h,2)*Beta*T_s + T_L);
B
T = A\B
x = 1:(rozmiar+2)

T = [T_0 T' T_L];

scatter(x, T)
