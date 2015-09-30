%Function to calculate the eigenvalues
function [eigenvalues] = makeEgs(Donecolumn)
%This equations come from part II of Kingsley 2005 
% “Introduction to DTI Mathematics Part I: Tensors, Rotations, 
% and Eigenvectors.
 
%Making a 6x1 matrix into a 3x3 matrix
D=ones(3,3);
D(1,1)=Donecolumn(1);
D(1,2)=Donecolumn(4);
D(1,3)=Donecolumn(5);
D(2,1)=D(1,2);
D(2,2)=Donecolumn(2);
D(2,3)=Donecolumn(6);
D(3,1)=D(1,3);
D(3,2)=D(2,3);
D(3,3)=Donecolumn(3);
 
%Preprocessed contants that will be used to calculate evals and evecs
I1= D(1,1)+D(2,2)+D(3,3);
I2= D(1,1)*D(2,2)+D(2,2)*D(3,3)+D(3,3)*D(1,1)-(D(1,2)^2+D(1,3)^2+D(2,3)^2);
I3= D(1,1)*D(2,2)*D(3,3)+2*D(1,2)*D(1,3)*D(2,3)-(D(3,3)*D(1,2)^2+D(2,2)*D(1,3)^2+D(1,1)*D(2,3)^2);
v=(I1/3)^2-I2/3;
s=(I1/3)^3-I1*I2/6+I3/2;
theta=acos(s/v^(3/2))/3;
 
%Calculating the eigenvalues
lambda1=I1/3+ 2*v^(1/2)*cos(theta);
lambda2=I1/3- 2*v^(1/2)*cos(pi/3+theta);
lambda3=I1/3- 2*v^(1/2)*cos(pi/3-theta);
eigenvalues(1)=lambda1;
eigenvalues(2)=lambda2;
eigenvalues(3)=lambda3;
%Function to calculate the following eigenvectors
%Rodrigo Perea
%Objective: This function will accept eigenvalues (3x1) and D 
% tensor in a(6x1) column and output a 3x1 Eigenvector array. 
 
%This equations come from part II of Kingsley 2005
% Introduction to DTI Mathematics Part I: Tensors, Rotations, 
% and Eigenvectors making Eigenvectors:
 
 
% Egs = Eigenvalues previous calculated.
% D=diffusion tensor calculated with as 6x1 column
% Ez= arbitraty values for the eigenvalue Ez
 
function [Evs] = makeEvs(Egs,Donecolumn,Ez)
 %Variables for Egs:
%The tensor model converted in a 3x3 matrix:
D(1,1)=Donecolumn(1);
D(1,2)=Donecolumn(4);
D(1,3)=Donecolumn(5);
 
D(2,1)=D(1,2);
D(2,2)=Donecolumn(2);
D(2,3)=Donecolumn(6);
 
D(3,1)=D(1,3);
D(3,2)=D(2,3);
D(3,3)=Donecolumn(3);
for i=1:3
A(i)=D(1,1)-Egs(i);
B(i)=D(2,2)-Egs(i);
C(i)=D(3,3)-Egs(i);
end
% 
for i=1:3
Evs(i,1)=Ez(i)*(D(1,2)*D(2,3)-B(i)*D(1,3))/(A(i)*B(i)-D(1,2)^2);
Evs(i,2)=Ez(i)*(D(1,2)*D(1,3)-A(i)*D(2,3))/(A(i)*B(i)-D(1,2)^2);
Evs(i,3)=Ez(i);
end

