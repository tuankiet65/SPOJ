program qbmseq;
uses crt;
var n, i, d, max: integer;
    a: array [1..10000] of longint;
function check(n: longint): boolean;
 var k: longint;
 begin
  k:=trunc(sqrt(n*2));
  if k*(k+1)=n then exit(true) else exit(false);
 end;
begin
 readln(n);
 for i:=1 to n do
  readln(a[i]);
 d:=0;
 max:=0;
 for i:=1 to n do begin
  if check(a[i]) then
   if d=0 then inc(d);
   if a[i]>=a[i-1] then inc(d);
  if not check(a[i]) or (a[i]>a[i-1]) then begin
   if d>max then max:=d;
   d:=0;
  end;
 end;
 if d>max then max:=d;
 write(max)
end.