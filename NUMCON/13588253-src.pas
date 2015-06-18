program ketnoi;
var t, tout: text;
    i, n, tmp, i2: longint;
    a: array [1..100] of string;
    tmps: string;
function compare(n, k: longint): boolean;
 var i: longint;
     s, s2: ansistring;
 begin
  s:='';
  for i:=1 to n-1 do
   s:=s+a[i];
  s2:=s+a[k];
  s:=s+a[n];
  compare:=s>s2;
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
  for i2:=1 to n do
   if compare(i, i2) then begin
    tmps:=a[i];
    a[i]:=a[i2];
    a[i2]:=tmps;
   end;
 for i:=1 to n do
  write(tout, a[i]);
 close(t);
 close(tout);
end.



