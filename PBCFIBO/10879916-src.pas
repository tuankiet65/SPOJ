program pbcfibo;
var s, n, i, sl: qword;
    k: integer;
    d: array [0..9999] of qword;
    f: array [1..10000] of qword;
begin
 readln(n, k, s);
 fillchar(d, sizeof(d), 0);
 fillchar(f, sizeof(f), 0);
 f[1]:=1;
 f[2]:=2;
 i:=3;
 d[1]:=1;
 d[2]:=1;
 while true do begin
  f[i]:=(f[i-1]+f[i-2]) mod k;
  inc(d[f[i]]);
  if (f[i]=f[2]) and (f[i-1]=f[1]) then begin
   sl:=i-2;
   dec(d[f[i]]);
   dec(d[f[i-1]]);
   f[i]:=0;
   f[i-1]:=0;
   break;
  end else inc(i);
 end;
 i:=0;
 while i<=k-1 do begin
  if n div sl<>0 then d[i]:=d[i]*(n div sl);
  inc(i);
 end;
 i:=1;
 sl:=n mod sl;
 while i<=sl do begin
  inc(d[f[i]]);
  inc(i);
 end;
 i:=0;
 while s>d[i] do begin
  s:=s-d[i];
  inc(i);
 end;
 write(i);
end.
