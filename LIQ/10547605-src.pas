program liq;
uses crt;
var n, i, i2, max: longint;
    a, f: array [1..1000] of longint;
begin
 readln(n);
 fillchar(f, sizeof(f), 0);
 f[1]:=1;
 for i:=1 to n do read(a[i]);
 for i:=2 to n do begin
  max:=0;
  for i2:=1 to i-1 do
   if (a[i2]<a[i]) and (f[i2]>max) then max:=f[i2];
  f[i]:=max+1;
 end;
 max:=0;
 for i:=2 to n do
  if f[i]>max then max:=f[i];
 write(max);
end.