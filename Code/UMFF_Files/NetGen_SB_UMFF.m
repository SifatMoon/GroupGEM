function [Net, L1, L2]=NetGen_SB_UMFF(N,pi,po,C)

% Generates Erdos Reyni network
% Faryad Darabi Sahneh
% Kansas State University
% Last Modified: Sep 2013
% Copyright (c) 2013, Faryad Darabi Sahneh. All rights reserved. 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted

l=0; L1=[]; L2=[];
for i=1:N
    i
    for j=i+1:N
        if(C(i,2)==C(j,2))
            p=pi;
        else
            p=po;
        end
         if rand<=p
            l=l+1;
            L1(l)=i; L2(l)=j;
            l=l+1;
            L1(l)=j; L2(l)=i;
         end
    end
end
L1=L1';L2=L2';L3=ones(length(L1),1);

[ Nei , I1 , I2 , d ] = NeighborhoodData2_UMFF ( N , L1 , L2,L3 ); I1=I1'; I2=I2';
Neigh{1}=Nei;

Net={Neigh,I1,I2,d};

end