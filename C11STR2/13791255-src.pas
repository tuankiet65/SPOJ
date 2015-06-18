program c11str2;
var s, s2, t: ansistring;
    i, len: longint;
    b: boolean;
begin
 readln(s);
 readln(s2);
 len:=length(s);
 for i:=1 to len do begin
  t:=copy(s, i, len);
  if (pos(t, s2)=1) then begin
   write(s, copy(s2, length(t)+1, length(s2)));
   b:=true;
   exit;
  end;
 end;
 if b<>true then write(s, s2);
end.