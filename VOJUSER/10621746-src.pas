program vojuser;var s, s2: string;p1, p2: byte;d: longint;function check(s: string): boolean;var i: byte;begin
check:=true;for i:=1 to length(s) do
if not(ord(s[i]) in [97..122, 48..57, 95]) then exit(false);end;begin
readln(s);while s<>'' do begin
while (pos('{#', s)<>0) and (pos('}', s)<>0) do begin
p1:=pos('{#', s);p2:=pos('}', s);s2:=copy(s, p1+2, p2-p1-2);delete(s, p1, p2-p1+1);if check(s2) then inc(d);end;readln(s);end;write(d);end.
