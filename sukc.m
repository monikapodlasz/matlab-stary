function [G]=sukc(FiP, Q, mi)
% O =[Fip,Q];
G=zeros(mi,2); %inicjalizacja mac wyj
[~, idx] =sort(FiP,'descend'); %sortowanie malejaco FiP

G(1:mi,:) = Q(idx(1:mi),:); %zapis najlepszych osobnikow do mac wyj

end
