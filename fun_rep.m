function [PWY] = fun_rep(PWE,FiP,lambda,typ)
[mi,n]=size(PWE);
maxprzys = 1; %maksymalna funkcja przyst

  switch typ
      case {'proporcjonalna'}
                  
%         FiPmin=min(FiP);
%         if (FiPmin<0)   FiP=FiP-FiPmin; end   % przeskaluj do dodatnich, je�li s� FiP ujemne 
        pr=FiP/sum(FiP);        % prawdopodobie�stwa reprodukcji
        Pr = cumsum(pr);       % dystrybuanta prawdopodobie�stwa
        ksi=rand(size(PWE,1),1);  % wylosowane liczby dla ka�dego osobnika
        iOut = ones([lambda 1]);          % indeksy osobnik�w w populacji wyj�ciowej populationOut; inicjalizacja tablicy 
        for i=1:mi            % wyodr�bnienie indeks�w osobnik�w w populacji wej�ciowej
           idx = find(ksi(i)<=Pr)'; 
           iOut(i) = min(idx);
        end
        PWY=PWE(iOut,:);
        
      case {'rankingowa'}
          [foo,Rangi] = sort(FiP);    % oblicz Rangi  (lepsze przystosowanie - mniejszy nr w tablicy Rangi)
        if maxprzys    % rangi trzeba odwroci� (dla maximum), bo sortowanie bylo rosn�ce 
            Rangi  = (lambda+1)-Rangi; 
        end     
        a=(1/(mi*100000));    % dobierz a>=0 ma�a, wsp�lna dla wszystkich osobnik�w cz�� prawdopodobie�stwa reprodukcji (a>0 => najgorszy ma szanse reprodukcji)
        pr0 = a + (1 -Rangi/ max(Rangi));    % pr0 - robocze prawdopodobie�stwo, nieznormalizowane do 1 
        k = 1/sum(pr0);          %dobierz k tak , aby suma prawdopodobie�stw=1 
        pr = a + k * (1 -Rangi/ max(Rangi));
        Pr = cumsum(pr);        % dystrybuanta prawdopodobie�stwa
        ksi=rand(size(PWE,1),1);  % wylosowane liczby dla ka�dego osobnika
        iOut = ones([lambda 1]);          % indeksy osobnik�w w populacji wyj�ciowej; inicjalizacja tablicy 
        for i=1:lambda             % wyodr�bnienie indeks�w osobnik�w rodzicielskich
            iOut(i) = min(find(ksi(i)<=Pr));
        end
        PWY=PWE(iOut,:); % reprodukcja
       otherwise
       disp([nie zdefiniowano funkcji dla tej opcji']); 
       PWY=[];
%     case {'turniejowa'}  
%         q = 4;                  % liczba osobnik�w bior�cych udzia� w turnieju 
%         PWY = zeros(mi);     % pusta tablica populacji wyj�ciowej 
%         for i=1:lambda
%            iQ = ceil(mi*rand(q,1));  % wyb�r do turnieju (q liczb ca�kowitych z zakresu 1-liczebno�� populacji wej�ciowej) 
%            % turniej: poszukiwanie najlepszego z q
%            if maxprzys
%                [best]  = max(FiP(iQ));
%            else
%                [best]  = min(FiP(iQ));
%            end    
%            PWY(i) = PWE(iQ(best));    % najlepszy umieszczany w populacji wyj�ciowej 
        end    

end