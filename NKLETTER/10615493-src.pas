program nkletter;
var s, s2, t: string;
    i, len: longint;
    b: boolean;
begin
 readln(s);
 readln(s2);
 len:=length(s);
 for i:=1 to len do begin
  t:=copy(s, i, len);
  if (pos(t, s2)=1) then begin
   write(i+length(s2)-1);
   b:=true;
   exit;
  end;
 end;
 if b<>true then write(len+length(s2));
end.