program maxnum;
var n, m, p, i: longint;
    a: array [1..30000] of longint;
    b: array [1..10007] of longint;
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
begin
 readln(n, p);
 for i:=1 to n do a[i]:=1;
 factor(n);
 factor3(p);
 m:=-maxlongint;
 for i:=2 to (n div 2) do
  if (a[i]<>0) and (b[i]<>0) then
   if (a[i] div b[i])>m then m:=a[i] div b[i];
 writeln(m);
end.
