% Plik test4.m DEFINICJA FUNKCJI ZAWSZE NA KOŃCU
silnia(5)
function sil = silnia(x)
        if (x <= 0)
                sil = 1;
        else
                sil = x * silnia(x - 1);
        end
end