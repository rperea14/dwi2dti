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

