uses math;var s,d,c:real;begin
read(s);d:=0;c:=1;
while d<s do begin
d:=d+(0.5*(1.07**c));c:=c+1;end;write(c:1:0);end.
