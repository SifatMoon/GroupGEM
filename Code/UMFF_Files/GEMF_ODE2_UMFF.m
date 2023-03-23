


function [t,X]=GEMF_ODE2_UMFF(Para,Net,X0,T)

% Simulates GEMF with M compartments, N nodes, and L network layers
% A_d is the M*M adjacency matrix of the nodal transition rate graph
% A_b is a cell data where A_d{l} is the M*M adjacency matrix of the
% edge-based transition rate graph of layer l
% Al is a cell data where Al{l} is the adjacecy matrix of network layer l
% ql is a 1*L vector of the influencer compartment of each layer
% T is the simulation run time
% Faryad Darabi Sahneh
% Kansas State University
% Last Modified: Sep 2013
% Copyright (c) 2013, Faryad Darabi Sahneh. All rights reserved. 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted

global Q_d Q_b Neigh I1 I2 q M L N

M=Para{1}; q=Para{2}; L=Para{3}; A_d=Para{4}; A_b=Para{5};

Neigh=Net{1}; I1=Net{2}; I2=Net{3}; N=length(I1);


Q_d=diag(sum(A_d,2))-A_d;

for l=1:L
%     A{l}=squeez(Al(:,:,l));
    A_bl=squeeze(A_b(:,:,l));
    Q_b{l}=diag(sum(A_bl,2))-A_bl;
end;

X0_vec=reshape(X0,M*N,1);
[t,X]=ode45(@GEMF_ODE_SOLVER2_UMFF,[0,T],X0_vec);

end