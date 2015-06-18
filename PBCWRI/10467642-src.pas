program spoj_pbcwri;
uses crt;
var n, m, i, i2, d: longint;
    a, b, tmp: ansistring;
function sort(s: ansistring): ansistring;
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
 readln(n, m);
 a:='';
 b:='';
 readln(tmp);
 for i:=1 to n do a:=a+tmp[i];
 a:=sort(a);
 readln(tmp);
 for i:=1 to m do b:=b+tmp[i];
 d:=0;
 for i:=1 to m-n+1 do
  if a=sort(copy(b, i, n)) then inc(d);
 write(d);
end.
