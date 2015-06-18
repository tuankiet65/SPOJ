program ketnoi;
var t, tout: text;
    i, n, tmp, i2: longint;
    a: array [1..100] of string;
    tmps: string;
function larger(s, s2: string): boolean;
 var i, orig_s: longint;
     tmps: ansistring;
     b: boolean=true;
 begin
  if length(s2)<length(s) then begin
   tmps:=s;
   s:=s2;
   s2:=tmps;
   b:=false;
  end;
  orig_s:=length(s);
  for i:=1 to length(s2)-length(s)+1 do
   s:=s+'0';
  for i:=1 to length(s) do
   if s[i]>s2[i] then exit(not(true xor b)) else
    if s[i]<s2[i] then exit(not(false xor b));
  larger:=not(((orig_s<length(s2)) xor b));
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
