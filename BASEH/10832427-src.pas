var k: longint;
    s: ansistring;
begin
 readln(k);
 s:='';
 while k<>0 do begin
  if k mod 2=0 then s:='0'+s else s:='1'+s;
  k:=k div 2;
 end;
 write(s);
end.