program vmrr;
var s: ansistring;
    s2: string;
    x, y: char;
    i, z: longint;
    n: int64;
begin
 readln(s);
 readln(s2);
 x:=s2[1];
 y:=s2[2];
 z:=0;
 n:=0;
 for i:=length(s)-1 downto 1 do begin
  if s[i+1]=y then
   inc(z);
  if s[i]=x then
   n:=n+z;
 end;
 writeln(n);
end.
