program qbmax;
var a, b: array [0..100, 1..100] of longint;
    m, n, i, i2: byte;
    x: longint;
function max(a, b, c: longint): longint;
 begin
  max:=a;
  if b>max then max:=b;
  if c>max then max:=c;
 end;
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
  b[m+1][i]:=-maxlongint;
 end;
 for i2:=2 to n do
  for i:=1 to m do
   b[i][i2]:=a[i][i2]+max(b[i][i2-1], b[i+1][i2-1], b[i-1][i2-1]);
 x:=b[1][n];
 for i:=2 to m do
  if b[i][n]>x then x:=b[i][n];
 write(x);
end.
