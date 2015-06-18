program c11km;
type arr=array [1..1000] of longint;
var n, i, d1, d2, tmp: longint;
    a, b: array [1..1000] of longint;
    t: int64;
procedure sort(l,r: longint; a: arr);
 var i, j: longint;
     x, y: int64;
 begin
  i:=l;
  j:=r;
  x:=a[(l+r) div 2];
  repeat
   while a[i]<x do inc(i);
   while x<a[j] do dec(j);
   if not(i>j) then begin
     y:=a[i];
     a[i]:=a[j];
     a[j]:=y;
     inc(i);
     j:=j-1;
    end;
  until i>j;
  if l<j then sort(l,j,a);
  if i<r then sort(i,r,a);
 end;
begin
 readln(n);
 t:=0;
 d1:=0;
 d2:=0;
 for i:=1 to n do begin
  readln(tmp);
  if tmp>=100 then begin
   inc(d2);
   b[d2]:=tmp;
  end else begin
   inc(d1);
   a[d1]:=tmp;
  end;
 end;
 if d1-1>1 then sort(1, d1, a);
 if d2-1>1 then sort(1, d2, b);
 for i:=1 to d2 div 2 do
  t:=t+b[i];
 if d2 mod 2<>0 then begin
  if i<>1 then t:=t+b[i+1] else t:=t+b[1];
  dec(d1);
 end;
 for i:=d1 downto 1 do
  t:=t+a[i];
 write(t);
end.
