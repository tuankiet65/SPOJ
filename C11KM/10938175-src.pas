program c11km;
var n, i, t: longint;
    a: array [1..1000] of longint;
procedure findmax(n: longint);
 var i, tmp1, tmp2: longint;
 begin
  tmp1:=0;
  tmp2:=0;
  for i:=1 to n do
   if (a[i]>tmp2) and (a[i]<>n) then begin
    tmp1:=i;
    tmp2:=a[i];
   end;
  a[tmp1]:=0;
 end;
begin
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 for i:=1 to n do
  if a[i]<100 then t:=t+a[i] else begin
   t:=t+a[i];
   findmax(a[i]);
  end;
 write(t);
end.
