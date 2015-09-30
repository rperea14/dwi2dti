function [Y] = makeY(S)
%Include intensity at b=0
sizeS=size(S);
Ya=S(2:sizeS(1));
Y=log(312./Ya)/800;

