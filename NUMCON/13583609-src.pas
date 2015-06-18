program ketnoi;
var t, tout: text;
    i, n, tmp, i2: longint;
    a: array [1..100] of string;
    tmps: string;
function min(a, b: longint): longint;
 begin
  if a>b then min:=b else min:=a;
 end;
function larger(s, s2: string): boolean;
 var i: longint;
 begin
  for i:=1 to min(length(s), length(s2)) do
   if s[i]>s2[i] then exit(true) else
    if s[i]<s2[i] then exit(false);
  larger:=(length(s)<length(s2));
 end;
begin
 assign(t, '');
 assign(tout, '');
 reset(t);
 rewrite(tout);
 n:=0;
 while not eof(t) do begin
  inc(n);
  readln(t, a[n]);
 end;
 for i:=1 to n-1 do
  for i2:=i+1 to n do
   if larger(a[i2], a[i]) then begin
    tmps:=a[i];
    a[i]:=a[i2];
    a[i2]:=tmps;
   end;
 for i:=1 to n do
  write(tout, a[i]);
 close(t);
 close(tout);
end.