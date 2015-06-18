program vojlev;
uses math;
var s, d, cap: extended;
begin
 readln(s);
 d:=0;
 cap:=1;
 while d<s do begin
  d:=d+(0.5*(power(1.07, cap)));
  cap:=cap+1;
 end;
 write(cap:1:0);
end