clc % czysci command window
clear all % zabija zmienne
close all % 

eps = 1./10.^(3:1:20); %początek:krok:koniec
%eps = 1./10.^(3:6);

f = @(x) x.^3 -2*x.^2 + 2;
%plot((-10:1:5), f((-10:1:5)));





kroczki = []
for i  = 1: length(eps)
    k=0;
    b = 1;
    a= -2;
    x0 = a + (b-a)./2
while (abs(f(x0)) > eps(i))
   
    x0 = a + (b-a)./2 ;
if(f(x0)*f(a) > 0)
    %disp("taki sam znak co a, w przedziale (x0, b)")
    a = x0;
     k = k +1;
elseif(f(x0)*f(b) > 0)
    %disp("taki sam znak co b, w przedziale (a,x0)")
    b= x0;
     k = k +1;
end
end
    kroczki(i) = k;
end
    disp(kroczki)
    %x = krok y= epsilon

    %linia teoretyczna
    k = @(a, b, e) log2((b-a)./e);
    b = 1;
    a= -2;
    kteo =k(a, b, eps)
    %plot(eps, kteo)
    
    %semilogx(kroczki, eps, "*", kteo, eps, "r")
    semilogx( eps,kroczki, "*",  eps, kteo, "r")
    
