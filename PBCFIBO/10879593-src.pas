program pbcfibo;
var f1, f2, f3, s, n, i: qword;
    k: integer;
    d: array [0..9999] of qword;
begin
 readln(n, k, s);
 fillchar(d, sizeof(d), 0);
 f1:=1;
 f2:=2;
 inc(d[1]);
 inc(d[2]);
 i:=3;
 while i<=n do begin
  f3:=(f1+f2) mod k;
  f1:=f2;
  f2:=f3;
  inc(d[f3]);
  inc(i);
 end;
 i:=0;
 while s>d[i] do begin
  s:=s-d[i];
  inc(i);
 end;
 write(i);
end.