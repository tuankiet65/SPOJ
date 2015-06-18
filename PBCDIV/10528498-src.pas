program pbcdiv;
uses crt;
var n, a, b, i, dem, i2: longint;
function d(n: longint): longint;
 begin
  d:=0;
  if n mod 4=0 then inc(d);
  if n mod 6=0 then inc(d);
  if n mod 15=0 then inc(d);
 end;
begin
 readln(n);
 dem:=0;
 for i:=1 to n do begin
  readln(a, b);
  for i2:=a to b do
   if d(i2)=2 then
    inc(dem);
  writeln(dem);
  dem:=0;
 end;
end.
