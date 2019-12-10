
clc; clear;  close all;      
scrsz=get(0,'ScreenSize');  scrsz=round([1 1 1 0.88].*scrsz+[0 0.05*scrsz(4) 0 0]);
 scrsz=round([0.9 0.9 0.9 0.80].*scrsz+[0 0.05*scrsz(4) 0 0]); 
 figure; set(gcf,'Position',scrsz);

%Inicjalizacja populacji
mi= 100; %liczebnoœæ populacji
lambda= 120; % liczebnoœæ populacji wyjœciowej
g1=0;
g2=255; 
%kodowanie rzeczywistoliczbowe
P0= randi([1 800],100,2);
typ_reprodukcji ='proporcjonalna'; %proporcjonalna, rankingowa
pc=0.7;     % prawdopodobienstwo krzy¿owania 
pm =0.1;    % prawdopodobienstwo mutacji
iter = 30;  %maksymalna liczba iteracji
typ_fun=2;  %ró¿ne funkcje przystosowania 
typ_obr =2; %wybór obrazu do wyœwietlania
% wczytanie obrazów do wyœwietlania
% inicjalizacja tablic œredniego, max i min przystosowania 
Ymean = zeros(1,iter); Ymax = zeros(1,iter); Ymin = zeros(1,iter);
FiPR =fun_przys(P0,typ_fun); %ocena populacji 
informacja = ['mi=' num2str(mi) ' lambda=' num2str(lambda) '  Reprodukcja ' typ_reprodukcji  '  pc=' num2str(pc) ' pm=' num2str(pm)];
WidokPrzystosowania =1;  % w³¹cz (1)/ wy³¹cz (0) wyswietlanie punktów na krajobrazie f.przystosowania

% wartoœci przystosowañ w populacji P0
Ymean(1)=  mean(FiPR);                   % œrednie przystosowanie
    Ymin(1) =  min(FiPR);                    % najs³absze przystosowanie
    Ymax(1)=   max(FiPR);        % najsilniejsze przystosowanie

 for k=2:iter      % 1-sza populacja z inicjalizacji 
   
   T = fun_rep(P0,FiPR,lambda,typ_reprodukcji);          % reprodukcja
   Z = krzyz(T,pc);        % krzy¿owanie
   Q =  mut(Z,pm);         % mutacja
   FiPP =fun_przys(Q,typ_fun);        % ocena dopasowania
   P0 = sukc(FiPP, Q, mi);  
  
% Aktualizacja wartoœci przystosowania w populacji
    Ymean(k)=  mean(FiPP);                   % œrednie przystosowanie
    Ymin(k) =  min(FiPP);                    % najs³absze przystosowanie
    Ymax(k)=   max(FiPP);                  % najsilniejsze przystosowanie
           
 
   
    if ( WidokPrzystosowania==1)
        % Wyœwietlanie populacji popRodzicow na krajobrazie funkcji przystosowania
%         figure
%         imhist(sr1)
        
        fun_wyswfipp(Q,typ_obr);
        title(informacja);
        pause(0.4);% wyœwietlenie populacji potomnej
        
    end
 end 
 % Wyœwietlenie przebiegów œr., max i min przystosowania oraz œr. przystosowania chromosomów schematu S w populacji P
figure;
hold on;    grid on;
plot(Ymax,'g','LineWidth',2);
plot(Ymean,'k','LineWidth',4);
plot(Ymin,'r','LineWidth',2);
xlim([1 k]);     xlabel('Iteracja');
legend('Maks. przystosowanie w P','Sr. przystosowanie w P','Min. przystosowanie w P','Location','Best');
set(gca,'FontSize',15);     set(gcf,'Position',scrsz);



