program ilsmath;
uses math;
var n, i, ca: longint;
    res: extended;
    a: array [1..100] of longint;
function ceil_custom(n: extended): int64;
 begin
  ceil_custom:=trunc(n);
  if frac(n)>0 then inc(ceil_custom);
 end;
begin
 fillchar(a, sizeof(a), 0);
 ca:=0;
 readln(n);
 res:=0;
 i:=0;
 if n=0 then begin
  write(0);
  exit;
 end;
 while ceil_custom(res)<n do begin
  inc(i);
  res:=res+log10(i);
 end;
 while ceil_custom(res)=n do begin
  inc(ca);
  a[ca]:=i;
  inc(i);
  res:=res+log10(i);
 end;
 writeln(ca);
 for i:=1 to ca do writeln(a[i]);
end.
