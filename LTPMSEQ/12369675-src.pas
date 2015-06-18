program ltpmseq;
var a: array [1..15] of byte;
    n, i, i2: longint;
    s: string;
function check: boolean;
 var i: longint;
 begin
  for i:=1 to 15 do
   if a[i]<>0 then exit(true);
  check:=false;
 end;
begin
 readln(n);
 for i:=1 to n do begin
  readln(s);
  for i2:=1 to length(s) do
   a[i2]:=a[i2] xor byte(s[i2]);
 end;
 if check() then begin
  for i:=1 to 15 do if a[i]<>0 then write(chr(a[i]))
 end else write(-1);
end.

