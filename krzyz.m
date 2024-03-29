function [Z] = krzyz(T,pc)
Z = T;      % generowanie calej populacji tymczasowej jako kopii rodzicielskiej (szybsze w Matlabie) 
            % następnie zmiana osobników podlegających krzyżowaniu
[mi,n] = size(T);
ksi_c = rand([mi 1])<=pc;    % decyzja o krzyzowaniu 
 
iZ = find(ksi_c);       % indeksy osobników podlegających krzyżowaniu
n_par = floor(length(iZ)/2);    % liczba par rodzicielskich, ewentualny ostani nieparzysty osobnik pozostaje bez zmiany

%  krzyżowanie bez zwracania
for i=1:2:2*n_par
    X1 = Z(iZ(i),:);
    X2 = Z(iZ(i+1),:);
    [Y1,Y2]=krzyzowanie(X1,X2);
    Z(iZ(i),:) = Y1;
    Z(iZ(i+1),:) = Y2;
end
