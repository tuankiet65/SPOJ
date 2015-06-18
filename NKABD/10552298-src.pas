program nkabd;
uses crt;
var l, r, i, j, d: longint;
    p: array [1..100000] of longint;
begin
 fillchar(p, sizeof(p), 0);
 readln(l, r);
 for i:=1 to r div 2 do begin
  j:=2;
 while i*j<=r do begin
   inc(p[i*j], i);
   inc(j);
  end;
 end;
 for i:=l to r do
  if p[i]>i then
   inc(d);
 write(d);
end.