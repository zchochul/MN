%Metoda Gaussa Jordana
clc % czysci command window
clear all % zabija zmienne
close all % 

B = [9 8 -2 2 -2; 7 -3 -2 7 2; 2 -2 2 -7 6; 4 8 -3 3 -1; 2 2 -1 1 4];
B;

A = [9 8 -2 2 -2 21; 7 -3 -2 7 2 11; 2 -2 2 -7 6 -4; 4 8 -3 3 -1 16; 2 2 -1 1 4 9];
A2 = [9 8 -2 2 -2 21; 7 -3 -2 7 2 11; 2 -2 2 -7 6 -4; 4 8 -3 3 -1 16; 2 2 -1 1 4 9];


b = [21; 11; -4; 16; 9];
b;

%porównanie z wartościami zwracanymi przez funkcję wbudowaną
x_matlab = B\b;

%met Gaussa Jordana

[wiersze, kolumny] = size(A);

for i = 1:wiersze
    A(i,:) = A(i, :)/A(i,i);
    for j = 1:wiersze
        if (i == j)
        end
        if (i ~= j)
            A(j, :) = A(j, :) - A(j,i)*A(i,:);
        end
    end
end

b1 = [9; 7; 2; 4; 2];
b2 = [17; 4; 0; 12; 4];
b3 = [15; 2; 2; 9; 3];
b4 = [17; 9; -5; 12; 4];
b5 = [15; 11; 1; 11; 8];

A2(:, kolumny + 1) = b1;
A2(:, kolumny + 2) = b2;
A2(:, kolumny + 3) = b3;
A2(:, kolumny + 4) = b4;
A2(:, kolumny + 5) = b5;


[wiersze2, kolumny2] = size(A2);
for i = 1:wiersze2
    A2(i,:) = A2(i, :)/A2(i,i);
    for j = 1:wiersze2
        if (i == j)
        end
        if (i ~= j)
            A2(j, :) = A2(j, :) - A2(j,i)*A2(i,:);
        end
    end
end

