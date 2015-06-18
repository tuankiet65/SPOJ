program qbmax;
uses math;
var a, b: array [0..100, 1..100] of longint;
    m, n, i, i2: byte;
    x: longint;
begin
 readln(m, n);
 for i:=1 to m do begin
  for i2:=1 to n do read(a[i][i2]);
  readln;
 end;
 for i:=1 to m do
  b[i][1]:=a[i][1];
 for i:=1 to n do begin
  b[0][i]:=-maxlongint;
  b[n+1][i]:=-maxlongint;
 end;
 for i:=2 to n do
  for i2:=1 to m do
   b[i][i2]:=a[i][i2-1]+max(b[i][i2+1], max(b[i-1][i2+1], b[i+1][i2+1]));
 x:=-maxlongint;
 for i:=1 to m do
  if b[i][n]>x then x:=b[i][n];
 write(x);
end.
