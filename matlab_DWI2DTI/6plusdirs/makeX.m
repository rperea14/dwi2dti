%EECS 700 Project: Implementation of X
%Objective: Implements X with the given input:
%Intensities= intenstity at each specific level.
% Output:
% X=ln(Intensities)
%This equations come from part III of Kingsley 2005 
% "Introduction to DTI Mathematics Part II: Tensors, 
%  Rotations, and Eigenvectors.

%making Eigenvectors:
function [X] = makeX(Intensities)
X=log(Intensities);


