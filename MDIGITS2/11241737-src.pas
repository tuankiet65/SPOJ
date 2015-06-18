program mdigits2;
uses crt;
var s, tmp: ansistring;
    i, n: longint;
begin
 readln(n);
 s:='';
 i:=0;
 for i:=1 to n do begin
  str(i, tmp);
  s:=s+tmp;
 end;
 str(n, tmp);
 write(pos(tmp, s));
end.
