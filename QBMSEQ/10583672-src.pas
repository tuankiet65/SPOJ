program qbmseq;
uses crt;
const ud=14141;
var n, i, d, max: integer;
    a: array [1..10000] of longint;
    u: array [1..ud+1] of longint;
function find(f, t, num: longint): boolean;
 var tmp: longint;
 begin
  if (f=t) and (u[f]<>num) then exit(false);
  tmp:=(f+t) div 2;
  if num=u[tmp] then exit(true) else
   if num<u[tmp] then exit(find(f, tmp-1, num)) else exit(find(tmp+1, t, num));
 end;
begin
 u[1]:=1;
 i:=1;
 while u[i]<100000000 do begin
  inc(i);
  u[i]:=u[i-1]+i;
 end;
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 d:=0;
 max:=0;
 for i:=2 to n do
  if (a[i]>=a[i-1]) and (find(1, ud, a[i])) then inc(d) else begin
   if d>max then max:=d;
   d:=0;
  end;
 if d>max then max:=d;
 write(max)
end.