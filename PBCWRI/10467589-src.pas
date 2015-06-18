program spoj_pbcwri;
uses crt;
var n, m, i, i2, d: longint;
    sn, sm: widestring;
function sort(s: widestring): widestring;
 var i, i2: longint;
     c: char;
 begin
  for i:=1 to length(s)-1 do
   for i2:=i to length(s) do
    if ord(s[i])>ord(s[i2]) then begin
     c:=s[i];
     s[i]:=s[i2];
     s[i2]:=c;
    end;
  sort:=s;
 end;
begin
 clrscr;
 read(n, m, sn, sm);
 d:=0;
 for i:=1 to m-n+1 do
  if sn=sort(copy(sm, i, n)) then inc(d);
 write(d);
end.