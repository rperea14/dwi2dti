%Rodrigo Perea
%Implementation of the B matrix.
%Objective: This function will accept gradient directions w 
%           b=0 intensities making a matrix GsWithB0s(Nx3) 
%           and the corresponding intensities eps (Nx1) and D %           tensor in a and will output a B matrix.
 
%This equations come from part III of Kingsley 2005 
%"Introduction to DTI Mathematics Part II: Tensors, Rotations, % and Eigenvectors


%making Eigenvectors:
function [B] = makeB(GsWithB0s)
sizeGsWithB0s=size(GsWithB0s);
% %Check how many 0s are in the function and remove them from gradients

%------------------COMMENT BEGIN
% count=0 %index that will account for gradient with no zero
% for i=1:sizeGsWithB0s(1)
%     if ((GsWithB0s(i,1) ==0 && GsWithB0s(i,1) ==0) && GsWithB0s(i,3) == 0)
%         count=count+1;
%     end
% end
%------------------COMMENT END

sizeGsWithB0s=size(GsWithB0s);
Gs=GsWithB0s;
% Gs=GsWithB0s(2:sizeGsWithB0s(1),:);
 
sizeGs=size(Gs);
%Initializing H for the variables...
B=ones(sizeGs(1),6);
 
for i=1:sizeGs(1)
    %For exmaple H1=[Gx^2 Gy^2 Gz^2 2GxGy 2GxGz 2GyGz]
%same for all the other directions...
B(i,1)=-800*Gs(i,1)^2;
B(i,2)=-800*Gs(i,2)^2;
B(i,3)=-800*Gs(i,3)^2;
B(i,4)=-800*2*Gs(i,1)*Gs(i,2);
B(i,5)=-800*2*Gs(i,1)*Gs(i,3);
B(i,6)=-800*2*Gs(i,2)*Gs(i,3);
B(i,7)=1;   
end
Function to make the Σ-1 Matrix:
%Rodrigo Perea
%Objective: Implements capital sigma with the given input:
% Intensities= intensity at each specific level.
% This equations come from part III of Kingsley 2005 " 
% Introduction to DTI
%Mathematics Part II: Tensors, Rotations, and Eigenvectors.

%making Eigenvectors:
function [SIGMA] = makeSIGMA(Intensities,B)
% Creating a covariance matrix and multiply it by a identity function of
% same length
sizeI=size(Intensities);
 
%Making the covariance Squared
Cov=diag(cov(Intensities));%.*eye(sizeI(1),size(2));
CovSquare=Cov.^2;
 
%Making the intensities Square
IntSquare=Intensities.^2;
 
 
% Making SIGMA
SIG=IntSquare./CovSquare;
% And diagonalizing SIGMA....
SIGMA=diag(SIG);


