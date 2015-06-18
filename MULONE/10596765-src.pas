program mulone;
uses crt;
var a: array [1..2000000] of longint;
    k, i, s, i2, du, x: longint;
    st, ss: ansistring;
    c: char;
begin
 readln(k);
 for i:=1 to k do begin
  readln(s);
  for i2:=1 to s do a[i2]:=i2;
  for i2:=s+1 to (s*2)-1 do a[i2]:=a[i2-1]-1;
  du:=0;
  for i2:=(s*2)-1 downto 1 do begin
   str((a[i2]+du) mod 10, ss);
   st:=ss+st;
   du:=(a[i2]+du) div 10;
  end;
  writeln(st);
  st:='';
 end;
end.