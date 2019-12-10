function [Y1,Y2]=krzyzowanie(X1,X2);
ksi = rand(1);   
        Y1 = round((1-ksi)*X1 + ksi* X2);
        Y2  = round(ksi*X1 +(1-ksi)*X2);
end