program qbmax;
var a, b: array [0..101, 0..101] of longint;
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
  a[i][0]:=-maxint;
  a[i][101]:=-maxint;
  a[0][i]:=-maxint;
  a[101][i]:=maxint;
 end;
 for i2:=2 to n do
  for i:=1 to m do
   a[i][i2]:=a[i][i2]+max(a[i][i2-1], a[i+1][i2-1], a[i-1][i2-1]);
 x:=b[1][n];
 for i:=2 to m do
  if a[i][n]>x then x:=a[i][n];
 write(x);
end.
