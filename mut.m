function [P]=mut(Z,pm)
% P0 - populacja tymczasowa po krzy�owaniu
% pm - prawdopodobie�stwo mutacji
% P - populacja potomna

[mi,n]=size(Z);             % mi - liczebno�� populacji, n - d�ugo�� chromosomu
ksi_m=rand(mi,n)<=pm;       % decyzja o mutacji
P=Z;   % generuj populacj� potomn� z 
iO = find(ksi_m) >0; % indeksy osobnik�w podlegaj�cych mutacji
P(iO) = Z(iO) + randi([-5,5],1,1); %mutacja
% for i=1:length(P) %zabezpieczenie przed przekroczeniem wartosci max
%     if P(i)>255
%         P(i)=255;
%     else 
%         P(i)=P(i);
%     end
% end
