program pbcdiv;
const lookup: array [0..60] of byte=(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5);
var t, i: longint;
    a, b, d: qword;
procedure proc;
 var i: qword;
 begin
  i:=a;
  while i<=b do begin
   if ((i mod 12=0) or (i mod 30=0)) and (i mod 60<>0) then inc(d);
   inc(i);
  end;
 end;
begin
 readln(t);
 for i:=1 to t do begin
  readln(a, b);
  d:=0;
  if b-a+1<60 then proc else begin
   d:=5*((b-a+1) div 60);
   a:=a+60*((b-a+1) div 60);
   d:=d+lookup[b-a+1];
  end;
  writeln(d);
 end;
end.