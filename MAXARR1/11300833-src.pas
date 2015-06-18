program maxarr1;
var a, b: array [0..100000] of longint;
    t, gend, n, i: longint;
procedure gene(x, y: longint);
 var i: longint;
 begin
  for i:=x to y do begin
   if i mod 2=0 then
    a[i]:=a[i div 2]
   else
    a[i]:=a[i div 2]+a[(i div 2)+1];
   if a[i]>b[i-1] then b[i]:=a[i] else b[i]:=b[i-1];
  end;
 end;
begin
 a[0]:=0;
 a[1]:=1;
 b[0]:=0;
 b[1]:=1;
 gend:=2;
 readln(t);
 for i:=1 to t do begin
  readln(n);
  if n>gend then begin
   gene(gend, n);
   inc(gend, n);
  end;
  writeln(b[n]);
 end;
end.


