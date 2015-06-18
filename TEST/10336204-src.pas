program TEST;
uses crt;
var n: longint;
begin
 n:=0;
 while n<>42 do begin
  readln(n);
  if n<>42 then writeln(n);
 end;
end.