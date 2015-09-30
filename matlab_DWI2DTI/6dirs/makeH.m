function [H] = makeH(GsWithB0s)
%Include vector 0 0 0!!!
%Getting rid og b=0 parameter since its not important
sizeGsWithB0s=size(GsWithB0s);
%Check how many 0s are in the function and remove them from gradients
count=0; %index that will account for gradient with no zero
for i=1:sizeGsWithB0s(1)
    if ((GsWithB0s(i,1) ==0 && GsWithB0s(i,1) ==0) && GsWithB0s(i,3) == 0)
        count=count+1;
    end
end
% Gs with no zero gradients
Gs=GsWithB0s(count+1:sizeGsWithB0s(1),:);
sizeGs=size(Gs);
%Initializing H for the variables...
H=ones(sizeGs(1),6);
for i=1:sizeGs(1)
    %For exmaple H1=[Gx^2 Gy^2 Gz^2 2GxGy 2GxGz 2GyGz]
%same for all the other directions...
H(i,1)=Gs(i,1)^2;
H(i,2)=Gs(i,2)^2;
H(i,3)=Gs(i,3)^2;
H(i,4)=2*Gs(i,1)*Gs(i,2);
H(i,5)=2*Gs(i,1)*Gs(i,3);
H(i,6)=2*Gs(i,2)*Gs(i,3);
end

