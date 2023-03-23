function dX=GEMF_ODE_SOLVER2_UMFF(t,X)

% Solves GEMF ODE
% Faryad Darabi Sahneh
% Kansas State University
% Last Modified: Sep 2013
% Copyright (c) 2013, Faryad Darabi Sahneh. All rights reserved. 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted

global Q_d Q_b Neigh I1 I2 q M L N

x=reshape(X,M,N);

y=zeros(N,L);
dx=zeros(M,N);
for i=1:N
  for l=1:L
   if I1(l,i)>0
       Nei=Neigh{l}(1,I1(l,i):I2(l,i));
       Wei=Neigh{l}(2,I1(l,i):I2(l,i))';
       y(Nei,l)=y(Nei,l)+Wei*x(q(l),i);
   end
      
  end
    
end;


for i=1:N
      RM=-Q_d';
      for l=1:L
             RM=RM-y(i,l)*Q_b{l}';
      end;
      dx(:,i)=RM*x(:,i);
end;



dX=reshape(dx,M*N,1);

end
    