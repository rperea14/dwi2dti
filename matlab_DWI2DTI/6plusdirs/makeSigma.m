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


