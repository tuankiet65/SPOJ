program pbcfibo;
var f1, f2, f3, s, n: qword;
    k, i: integer;
    d: array [0..9999] of int64;
begin
 read(n, k, s);
 f1:=1;
 f2:=2;
 inc(d[1]);
 inc(d[2]);
 for i:=3 to n do begin
  f3:=(f1+f2) mod k;
  f1:=f2;
  f2:=f3;
  inc(d[f3]);
 end;
 i:=0;
 while s>d[i] do begin
  s:=s-d[i];
  inc(i);
 end;
 write(i);
end.