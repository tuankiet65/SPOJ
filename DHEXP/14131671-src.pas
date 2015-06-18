program dhexp;
var k, i, n: longint;
    a: array [1..100000] of longint;
    res: int64; 
procedure sort(l,r: longint);
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
 readln(n, k);
 for i:=1 to n do
  read(a[i]);
 sort(1, n);
 res:=a[1];
 for i:=2 to k+1 do
  res:=res+a[i];
 for i:=k+2 to n do
  res:=res-a[i];
 writeln(res);
end.
