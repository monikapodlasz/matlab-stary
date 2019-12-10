function fun_wyswfipp(p,typ_obr)
% p, Fi - populacja do wyœwietlenia, wartoœci funkcji przystosowania

switch typ_obr
    case 1
        
        O = imread('cb.png');
        O2= rgb2gray(O);
        O3=imresize(O2,[800,800]);
        imshow(O3)
%         imhist(O)
        
        hold on
        plot(p(:,2),p(:,1),'o', 'MarkerSize',3);
        hold off
    case 2
         O = imread('gradient.png');
         O1 = imread('gradient1.png');
         O2= imread('gradient2.png');
        o1= rgb2gray(O);
        o2= rgb2gray(O1);
        o3= rgb2gray(O2);
        O3=imresize(o1,[800,800]);
        O4=imresize(o2,[800,800]);
        O5=imresize(o3,[800,800]);
        subplot(1,3,1)
        imshow(O3)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);

   subplot(1,3,2)
        imshow(O4)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);
    
   subplot(1,3,3)
        imshow(O5)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);

case 3
    O = imread('g1.png');
         O1 = imread('g6.png');
         O2= imread('g7.png');
        o1= rgb2gray(O);
        o2= rgb2gray(O1);
        o3= rgb2gray(O2);
        O3=imresize(o1,[800,800]);
        O4=imresize(o2,[800,800]);
        O5=imresize(o3,[800,800]);
        subplot(1,3,1)
        imshow(O3)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);

   subplot(1,3,2)
        imshow(O4)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);
    
   subplot(1,3,3)
        imshow(O5)
%         imhist(O)
     
        hold on
        plot(p(:,2),p(:,1),'*', 'MarkerSize',3);
end
hold off
 

