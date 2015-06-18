program mdigits2;
uses crt;
var s, n, tmp: ansistring;
    i: longint;
begin
 readln(n);
 s:='';
 i:=0;
 for i:=1 to n do begin
  str(i, tmp);
  s:=s+tmp;
 end;
 write(pos(n, s));
end.
