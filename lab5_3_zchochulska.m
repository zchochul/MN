clc % czysci command window
clear all % zabija zmienne
close all % 

f1 = @(x,y,z) 10*(y-x);
f2 = @(x,y,z) x*(28-z)-y;
f3 = @(x,y,z) x*y-8/3*z;

h = 20/500;
t = 0:h:20;
n = 500;

X = [1; 1; 1;]; %warunki początkowe

K1 = zeros(3,1);
K2 = zeros(3,1);
K3 = zeros(3,1);
K4 = zeros(3,1);

for i=2:n-1
    X(:, i) = RK(f1, f2, f3, h, X(:, i-1));
end

plot3(X(1, :), X(2, :), X(3,:))

function res = k1(f, X)
    res = f(X(1), X(2), X(3));
end

function res = k2(f, X, h, K1)
    res = f(X(1) + 1/2*K1(1)*h, X(2) + 1/2*K1(2)*h, X(3) + 1/2*K1(3)*h);
end

function res = k3(f, X, h, K2)
    res = f(X(1) + 1/2*h*K2(1), X(2) + 1/2*h*K2(2), X(3) + 1/2*h*K2(3));
end

function res = k4(f, X, h, K3)
    res = f(X(1) + 1/2*h*K3(1), X(2) + 1/2*h*K3(2), X(3) + 1/2*h*K3(3));
end

function res = RK(f1, f2, f3, h, X)
    %K1
    K1(1) = k1(f1, X);
    K1(2) = k1(f2, X);
    K1(3) = k1(f3, X);

    %K2
    K2(1) = k2(f1, X, h, K1);
    K2(2) = k2(f2, X, h, K1);
    K2(3) = k2(f3, X, h, K1);

    %K3
    K3(1) = k3(f1, X, h, K2);
    K3(2) = k3(f2, X, h, K2);
    K3(3) = k3(f3, X, h, K2);

    %K4
    K4(1) = k4(f1, X, h, K3);
    K4(2) = k4(f2, X, h, K3);
    K4(3) = k4(f3, X, h, K3);

    %Yi
    X(1) = X(1) + 1/6*(K1(1) + 2*K2(1) + 2*K3(1) + K4(1))*h;
    X(2) = X(2) + 1/6*(K1(2) + 2*K2(2) + 2*K3(2) + K4(2))*h;
    X(3) = X(3) + 1/6*(K1(3) + 2*K2(3) + 2*K3(3) + K4(3))*h;
   
    res = X;
end


