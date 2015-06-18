program c11km;
uses crt;
var n, i, t: longint;
    a: array [1..1000] of longint;
procedure findmax(n2: longint);
 var i, tmp1, tmp2: longint;
 begin
  tmp1:=0;
  tmp2:=0;
  for i:=1 to n do
   if (a[i]>=tmp2) and (n2<>i) then begin
    tmp1:=i;
    tmp2:=a[i];
   end;
  if tmp1<>0 then a[tmp1]:=0;
 end;
begin
 clrscr;
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 for i:=1 to n do begin
  t:=t+a[i];
  if a[i]>100 then findmax(i);
  a[i]:=0;
 end;
 write(t);
end.
