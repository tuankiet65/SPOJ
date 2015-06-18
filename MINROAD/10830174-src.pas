program MINROAD;
type re=record
      d: longint;
      k: longint;
     end;
var a: array [1..300000] of re;
    n, a2, b, i, i2, da, db, min: longint;
procedure qsort(l, r: longint);
 var i, j, x: longint;
     y: re;
 begin
  i:=l;
  j:=r;
  x:=a[(i+j) div 2].d;
  repeat
   while a[i].d<x do inc(i);
   while x<a[j].d do dec(j);
   if not(i>j) then begin
    y:=a[i];
    a[i]:=a[j];
    a[j]:=y;
    inc(i);
    dec(j);
   end;
  until i>j;
  if l<j then qsort(l, j);
  if i<r then qsort(i, r);
 end;
begin
 readln(n, a2, b);
 for i:=1 to n do
  readln(a[i].d, a[i].k);
 qsort(1, n);
 min:=high(longint);
 for i:=1 to n do begin
  i2:=i;
  da:=0;
  db:=0;
  while ((da<a2) or (db<b)) and (i2<=n) do begin
   case a[i2].k of
    1: inc(da);
    2: inc(db);
   end;
   inc(i2);
  end;
  if (a[i2-1].d-a[i].d<min) and (da>=a2) and (db>=b) and (i2-1<=n) then min:=a[i2-1].d-a[i].d;
 end;
 if min<>high(longint) then write(min) else write(-1);
end.