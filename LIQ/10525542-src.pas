program liq;
uses crt;
var n, i, d, max, i2, tmp: integer;
    a: array [1..1000] of integer;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to n do begin
  d:=0;
  tmp:=0;
  for i2:=i to n do
   if a[i2]>tmp then begin
    tmp:=a[i2];
    inc(d);
   end;
  if d>max then max:=d;
 end;
 write(max);
end.