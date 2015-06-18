program loco;
var n, m: int64;
    i: longint;
    a: array [1..10000000] of integer;
begin
 readln(n, m);
 a[1]:=1;
 a[2]:=2;
 a[3]:=4;
 for i:=4 to n do
  a[i]:=(a[i-1]+a[i-2]+a[i-3]) mod m;
 writeln(a[n]);
end.