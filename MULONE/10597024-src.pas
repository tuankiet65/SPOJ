program mulone;
uses crt;
var k, i, s, i2, du, x: longint;
begin
 readln(k);
 for i:=1 to k do begin
  readln(s);
  for i2:=1 to (s-1) div 9 do write('123456790');
  for i2:=1 to (s-1) mod 9 do write(i2);
  for i2:=((s-1) mod 9)+1 downto 2 do write(i2);
  for i2:=1 to (s-1) div 9 do write('098765432');
  writeln(1);
 end;
end.