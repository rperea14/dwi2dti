%Importing gradient directions
Gs=importdata('../bvecs');
Gs6=importdata('bvecs6');
%Importing intensities at the followed directions
s=importdata('../VoxelIntensities_x76_y64_z21.txt');
s6=importdata('Intensities.txt');
%Making Y matrix Nx1, where N is the number of intensities at each gradient
Y6=makeY(s6);
H6=makeH(Gs6);
H=makeH(Gs);
 
%Check size of H
sizeH=size(H);
sizeH6=size(H6);
 
%Here is where we will determine the result of our Dtensor 
% using either

%Cramer's rule for a perfect solution or the least square 
% methods if N>6

%Using Cramer's rule to determine the Deff=D if the matrix is 
% 6x6, meaning the exact number of directions needed.
 
    %H Approach!!
    Dh6=inv(H6)*Y6;
    %B Approach!!
    B6=makeB(Gs6);
    X6=makeX(s6);
    SIGMA6=makeSIGMA(s6);
    Db6All=inv(B6'*SIGMA6*B6)*(B6'*SIGMA6)*X6;
    Db6=Db6All(1:size(Db6All)-1);
 
%Here we wil be using the least square methods to approximate 
% out D tensor components and thus using the B approach

    %B Approach!!
    B=makeB(Gs);
    X=makeX(s);
    SIGMA=makeSIGMA(s);
    DbAll=inv(B'*SIGMA*B)*(B'*SIGMA)*X;
    Db=DbAll(1:size(DbAll)-1);
 
%Computing the Eigevalues
Egs=makeEgs(Db);
Egs6=makeEgs(Db6);
 
%Computing the Eigenvectors. Ez are arbitrary an arbitrary 
% number for z directions so we can compare our results to the 
% program we used.
Ez =[ 0.697466 -0.521337 0.491680];
Ez6 =[ -.9333942 0.162498 0.318351];
Evs=makeEvs(Egs,Db,Ez);
Evs6=makeEvs(Egs6,Db6,Ez6);
 
%Computing the markers used in DTI
FAMD=makeMarkers(Egs);
FAMD6=makeMarkers(Egs6);


