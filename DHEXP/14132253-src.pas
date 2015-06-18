program dhexp;
var k, i, n: longint;
    a: array [1..100000] of longint;
    res, tmp: int64;
    t: text;
function calc(p, x: longint): int64;
 var i: longint;
 begin
  calc:=a[2];
  for i:=2 to p+1 do
   calc:=calc+x*a[i+1];
  for i:=p+2 to n do
   calc:=calc-x*a[i+1];
 end;
procedure sort(l, r: longint);
 var i,j,x,y: longint;
 begin
  i:=l;
  j:=r;
  x:=a[(l+r) div 2];
  repeat
   while a[i]>x do inc(i);
   while x>a[j] do dec(j);
   if i<=j then begin
    y:=a[i];
    a[i]:=a[j];
    a[j]:=y;
    inc(i);
    dec(j);
   end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;
begin
 res:=1 shl 63;
 assign(t, '');
 reset(t);
 readln(t, n, k);
 for i:=1 to n do
  read(t, a[i]);
 sort(2, n);
 tmp:=calc(k-1, 1);
 if a[1]+tmp>res then
  res:=a[1]+tmp;
 tmp:=calc(k, -1);
 if a[1]-tmp>res then
  res:=a[1]-tmp;
 writeln(res);
end.