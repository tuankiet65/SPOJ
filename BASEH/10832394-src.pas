program baseh;
var k, h, i: longint;
    s: ansistring;
begin
 readln(k, h);
 s:='';
 i:=k;
 while i<>0 do begin
  if i mod 2=0 then begin
   i:=i div 2;
   s:='0'+s;
  end;
  if i mod 2<>0 then begin
   i:=i div 2;
   s:='1'+s;
  end;
 end;
 write(s);
end.