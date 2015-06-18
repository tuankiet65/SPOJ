program c11str2;
var s, s2, t: ansistring;
    i, len: longint;
    b: boolean;
function check(s, s2: ansistring; n: longint): boolean;
 var i: longint;
 begin
  for i:=n to length(s) do begin
   if i-n+1>length(s2) then exit(false);
   if s[i]<>s2[i-n+1] then exit(false);
  end;
  check:=true;
 end;
begin
 readln(s);
 readln(s2);
 len:=length(s);
 for i:=1 to len do begin
  if check(s, s2, i) then begin
   write(copy(s, 1, i-1), s2);
   b:=true;
   exit;
  end;
 end;
 if b<>true then write(s, s2);
end.
