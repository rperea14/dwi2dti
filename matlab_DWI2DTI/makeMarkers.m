%Computing the MD
MD=mean(Egs);
%Computing the FA
e1=Egs(1);
e2=Egs(2);
e3=Egs(3);
FA=sqrt((3*(e1-MD)^2+(e2-MD)^2+(e3-MD)^2)/(2*(e1^2+e2^2+e3^2)));
Markers(1)=FA;
Markers(2)=MD;


