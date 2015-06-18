program kdel;
uses crt;
const m=612000;
var s, s2, s3: ansistring;
    n, k, ls, i: longint;
procedure sieve;
 var i, i2, s3: longint;
     p: array [2..m] of boolean;
     x: ansistring;
 begin
  fillchar(p, sizeof(p), true);
  for i:=2 to trunc(sqrt(m)) do
   if p[i] then begin
    i2:=0;
    while i*(i+i2)<=m do begin
     p[i*(i+i2)]:=false;
     inc(i2);
    end;
   end;
  i2:=0;
  for i:=2 to m do begin
   if p[i] then begin
    str(i, x);
    s:=s+x;
    inc(i2);
   end;
   if i2=n then break;
  end;
 end;
begin
 s:='';
 s2:='';
 readln(n, k);
 sieve;
 ls:=length(s);
 for i:=1 to k do begin
  s3:=copy(s, i, ls-k);
  if s3>s2 then s2:=s3;
 end;
 writeln(s2);
end.
