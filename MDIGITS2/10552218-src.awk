program mdigits2;
uses crt;
var s, n, tmp: ansistring;
    i: longint;
begin
 readln(n);
 s:='';
 i:=0;
 while pos(n, s)=0 do begin
  inc(i);
  str(i, tmp);
  s:=s+tmp;
 end;
 write(pos(n, s));
end.