function [PWY] = fun_rep(PWE,FiP,lambda,typ)
[mi,n]=size(PWE);
maxprzys = 1; %maksymalna funkcja przyst

  switch typ
      case {'proporcjonalna'}
                  
%         FiPmin=min(FiP);
%         if (FiPmin<0)   FiP=FiP-FiPmin; end   % przeskaluj do dodatnich, jeœli s¹ FiP ujemne 
        pr=FiP/sum(FiP);        % prawdopodobieñstwa reprodukcji
        Pr = cumsum(pr);       % dystrybuanta prawdopodobieñstwa
        ksi=rand(size(PWE,1),1);  % wylosowane liczby dla ka¿dego osobnika
        iOut = ones([lambda 1]);          % indeksy osobników w populacji wyjœciowej populationOut; inicjalizacja tablicy 
        for i=1:mi            % wyodrêbnienie indeksów osobników w populacji wejœciowej
           idx = find(ksi(i)<=Pr)'; 
           iOut(i) = min(idx);
        end
        PWY=PWE(iOut,:);
        
      case {'rankingowa'}
          [foo,Rangi] = sort(FiP);    % oblicz Rangi  (lepsze przystosowanie - mniejszy nr w tablicy Rangi)
        if maxprzys    % rangi trzeba odwrociæ (dla maximum), bo sortowanie bylo rosn¹ce 
            Rangi  = (lambda+1)-Rangi; 
        end     
        a=(1/(mi*100000));    % dobierz a>=0 ma³a, wspólna dla wszystkich osobników czêœæ prawdopodobieñstwa reprodukcji (a>0 => najgorszy ma szanse reprodukcji)
        pr0 = a + (1 -Rangi/ max(Rangi));    % pr0 - robocze prawdopodobieñstwo, nieznormalizowane do 1 
        k = 1/sum(pr0);          %dobierz k tak , aby suma prawdopodobieñstw=1 
        pr = a + k * (1 -Rangi/ max(Rangi));
        Pr = cumsum(pr);        % dystrybuanta prawdopodobieñstwa
        ksi=rand(size(PWE,1),1);  % wylosowane liczby dla ka¿dego osobnika
        iOut = ones([lambda 1]);          % indeksy osobników w populacji wyjœciowej; inicjalizacja tablicy 
        for i=1:lambda             % wyodrêbnienie indeksów osobników rodzicielskich
            iOut(i) = min(find(ksi(i)<=Pr));
        end
        PWY=PWE(iOut,:); % reprodukcja
       otherwise
       disp([nie zdefiniowano funkcji dla tej opcji']); 
       PWY=[];
%     case {'turniejowa'}  
%         q = 4;                  % liczba osobników bior¹cych udzia³ w turnieju 
%         PWY = zeros(mi);     % pusta tablica populacji wyjœciowej 
%         for i=1:lambda
%            iQ = ceil(mi*rand(q,1));  % wybór do turnieju (q liczb ca³kowitych z zakresu 1-liczebnoœæ populacji wejœciowej) 
%            % turniej: poszukiwanie najlepszego z q
%            if maxprzys
%                [best]  = max(FiP(iQ));
%            else
%                [best]  = min(FiP(iQ));
%            end    
%            PWY(i) = PWE(iQ(best));    % najlepszy umieszczany w populacji wyjœciowej 
        end    

end