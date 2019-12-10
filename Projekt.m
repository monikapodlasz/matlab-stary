
clc; clear;  close all;      
scrsz=get(0,'ScreenSize');  scrsz=round([1 1 1 0.88].*scrsz+[0 0.05*scrsz(4) 0 0]);
 scrsz=round([0.9 0.9 0.9 0.80].*scrsz+[0 0.05*scrsz(4) 0 0]); 
 figure; set(gcf,'Position',scrsz);

%Inicjalizacja populacji
mi= 100; %liczebno�� populacji
lambda= 120; % liczebno�� populacji wyj�ciowej
g1=0;
g2=255; 
%kodowanie rzeczywistoliczbowe
P0= randi([1 800],100,2);
typ_reprodukcji ='proporcjonalna'; %proporcjonalna, rankingowa
pc=0.7;     % prawdopodobienstwo krzy�owania 
pm =0.1;    % prawdopodobienstwo mutacji
iter = 30;  %maksymalna liczba iteracji
typ_fun=2;  %r�ne funkcje przystosowania 
typ_obr =2; %wyb�r obrazu do wy�wietlania
% wczytanie obraz�w do wy�wietlania
% inicjalizacja tablic �redniego, max i min przystosowania 
Ymean = zeros(1,iter); Ymax = zeros(1,iter); Ymin = zeros(1,iter);
FiPR =fun_przys(P0,typ_fun); %ocena populacji 
informacja = ['mi=' num2str(mi) ' lambda=' num2str(lambda) '  Reprodukcja ' typ_reprodukcji  '  pc=' num2str(pc) ' pm=' num2str(pm)];
WidokPrzystosowania =1;  % w��cz (1)/ wy��cz (0) wyswietlanie punkt�w na krajobrazie f.przystosowania

% warto�ci przystosowa� w populacji P0
Ymean(1)=  mean(FiPR);                   % �rednie przystosowanie
    Ymin(1) =  min(FiPR);                    % najs�absze przystosowanie
    Ymax(1)=   max(FiPR);        % najsilniejsze przystosowanie

 for k=2:iter      % 1-sza populacja z inicjalizacji 
   
   T = fun_rep(P0,FiPR,lambda,typ_reprodukcji);          % reprodukcja
   Z = krzyz(T,pc);        % krzy�owanie
   Q =  mut(Z,pm);         % mutacja
   FiPP =fun_przys(Q,typ_fun);        % ocena dopasowania
   P0 = sukc(FiPP, Q, mi);  
  
% Aktualizacja warto�ci przystosowania w populacji
    Ymean(k)=  mean(FiPP);                   % �rednie przystosowanie
    Ymin(k) =  min(FiPP);                    % najs�absze przystosowanie
    Ymax(k)=   max(FiPP);                  % najsilniejsze przystosowanie
           
 
   
    if ( WidokPrzystosowania==1)
        % Wy�wietlanie populacji popRodzicow na krajobrazie funkcji przystosowania
%         figure
%         imhist(sr1)
        
        fun_wyswfipp(Q,typ_obr);
        title(informacja);
        pause(0.4);% wy�wietlenie populacji potomnej
        
    end
 end 
 % Wy�wietlenie przebieg�w �r., max i min przystosowania oraz �r. przystosowania chromosom�w schematu S w populacji P
figure;
hold on;    grid on;
plot(Ymax,'g','LineWidth',2);
plot(Ymean,'k','LineWidth',4);
plot(Ymin,'r','LineWidth',2);
xlim([1 k]);     xlabel('Iteracja');
legend('Maks. przystosowanie w P','Sr. przystosowanie w P','Min. przystosowanie w P','Location','Best');
set(gca,'FontSize',15);     set(gcf,'Position',scrsz);



