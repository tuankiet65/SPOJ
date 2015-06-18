program nksgame;
uses crt;
var a, b: array [1..100000] of longint;
    n, i, i2, max: longint;
begin
 readln(n);
 for i:=1 to n do
  read(a[i]);
 for i:=1 to n do
  read(b[i]);
 max:=maxint;
 for i:=1 to n do 
  for i2:=1 to n do
   if abs(a[i]+b[i2])<max then max:=abs(a[i]+b[i2]);
 write(max);
end.