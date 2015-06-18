program maxnum;
var n, m, p, i, i2, i3: longint;
    a: array [1..30000] of longint;
    b: array [1..10007] of longint;
    c, d: array [1..10007] of longint;
procedure factor2(i, n: longint; var x: longint);
 begin
  while n mod i=0 do begin
   n:=n div i;
   inc(a[i], x);
  end;
  inc(a[n], x);
 end;
procedure factor(n: longint);
 var i, i2: longint;
 begin
  for i:=2 to trunc(sqrt(n)) do
   if a[i]>=1 then begin
    i2:=0;
    while i*i+i*i2<=n do begin
     factor2(i, i*i+i*i2, a[i*i+i*i2]);
     a[i*i+i*i2]:=0;
     inc(i2);
    end;
   end;
 end;
procedure factor3(n: longint);
 var i: longint;
 begin
  i:=2;
  while (n<>1) do begin
   if a[n]<>0 then begin
    inc(b[n]);
    exit;
   end;
   while (a[i]=0) and (n mod i<>0) do inc(i);
   while n mod i=0 do begin
    n:=n div i;
    inc(b[i]);
   end;
   inc(i);
  end;
 end;
function check: boolean;
 var i: longint;
 begin
  for i:=1 to i2 do
   if d[i]>a[c[i]] then exit(false);
  check:=true;
 end;
begin
 readln(n, p);
 filldword(a, n, 1);
 factor(n);
 factor3(p);
 for i:=1 to (p div 2) do
  if b[i]<>0 then begin
   inc(i2);
   c[i2]:=i;
   d[i2]:=b[i];
  end;
 i3:=1;
 while check do begin
  inc(i3);
  for i:=1 to i2 do
   d[i]:=d[i]+b[c[i]];
 end;
 writeln(i3-1);
end.
