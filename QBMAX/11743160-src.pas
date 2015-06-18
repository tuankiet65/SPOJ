program qbmax;
var a: array [0..101, 0..101] of longint;
    m, n, i, i2, x: longint;
function max(a, b, c: longint): longint;
 begin
  max:=a;
  if b>max then max:=b;
  if c>max then max:=c;
 end;
begin
 readln(m, n);
 for i:=1 to m do
  for i2:=1 to n do read(a[i][i2]);
 for i:=0 to 101 do begin
  a[i][0]:=-maxlongint;
  a[i][101]:=-maxlongint;
  a[0][i]:=-maxlongint;
  a[101][i]:=maxlongint;
 end;
 for i2:=2 to n do
  for i:=1 to m do
   a[i][i2]:=a[i][i2]+max(a[i][i2-1], a[i+1][i2-1], a[i-1][i2-1]);
 x:=-maxint;
 for i:=1 to m do
  if a[i][n]>x then x:=a[i][n];
 write(x);
end.
