 function [Fi]=fun_przys(W,mode)


switch mode
  
    case 1
        %czarno bialy obrazek
       Z=imread('cb3.png');
       Z2= rgb2gray(Z);
       Z3=imresize(Z2,[800,800]);
       Fi=zeros(size(W,1),1);
       for i=1:size(W,1)
       Fi(i)=Z3(W(i),W(i,2));
       end
       
      
    case 2
       %gradient
         Z=imread('gradient.png');
         Z2= rgb2gray(Z);
         Z3=imresize(Z2,[800,800]);
         X=imread('gradient1.png');
         X2= rgb2gray(X);
         X3=imresize(X2,[800,800]);
         V=imread('gradient2.png');
         V2= rgb2gray(V);
         V3=imresize(V2,[800,800]);
          
       G=zeros(size(W,1),1);
       for i=1:size(W,1)
       G(i)=Z3(W(i),W(i,2));
       end
       
       F=zeros(size(W,1),1);
       for i=1:size(W,1)
       F(i)=X3(W(i),W(i,2));
       end
       
       B=zeros(size(W,1),1);
       for i=1:size(W,1)
       B(i)=V3(W(i),W(i,2));
       end
       
       Fi=zeros(size(W,1),1);
       for i=1:size(W,1)
       Fi(i) = 0.33 *G(i) + 0.33 *F(i) + 0.34*B(i);
       end
       
    case 3
        Z=imread('g1.png');
         Z2= rgb2gray(Z);
         Z3=imresize(Z2,[800,800]);
         X=imread('g6.png');
         X2= rgb2gray(X);
         X3=imresize(X2,[800,800]);
         V=imread('g7.png');
         V2= rgb2gray(V);
         V3=imresize(V2,[800,800]);
          
       G=zeros(size(W,1),1);
       for i=1:size(W,1)
       G(i)=Z3(W(i),W(i,2));
       end
       
       F=zeros(size(W,1),1);
       for i=1:size(W,1)
       F(i)=X3(W(i),W(i,2));
       end
       
       B=zeros(size(W,1),1);
       for i=1:size(W,1)
       B(i)=V3(W(i),W(i,2));
       end
       
       Fi=zeros(size(W,1),1);
       for i=1:size(W,1)
           % G- temperatura, F- wilgotnoœæ, B- dostêp do po¿ywienia
           % polarny 
       %Fi(i) = 0.3 *abs(40 -G(i)) + 0.2 *F(i) + 0.5*B(i);
       % panda
       Fi(i) = 0.1*abs(200-G(i)) + 0.3*F(i) + 0.6*B(i);
       % niedzwiedz brunatny
        %Fi(i) = 0.2*abs(100-G(i)) + 0.4*F(i) + 0.4*B(i);
       
        
       % wartoœc bezwzglêdna temperatyura optymalna - wartosc piksela
        
       end 
        
    otherwise
       disp([nie zdefiniowano funkcji dla tej opcji']); 
       Fi=[];
% dodaæ nowe gradienty
% przemno¿yc przez odpowiednie wagi
% zrobiæ sumê z przystosowaniem 
% wyœwietliæ 
end