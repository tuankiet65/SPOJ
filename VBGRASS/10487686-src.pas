program vbgrass;
var f: array [0..101, 0..101] of boolean;
    r, c, i, i2: byte;
    d: int64;
    tmp: string;
begin
 fillchar(f, sizeof(f), false);
 readln(r, c);
 for i:=1 to r do begin
  readln(tmp);
  for i2:=1 to c do
   if tmp[i2]='#' then f[i][i2]:=true;
 end;
 d:=0;
 for i:=1 to r do
  for i2:=1 to c do
   if f[i][i2]=true then begin
    inc(d);
    if f[i+1][i2]=true then f[i+1][i2]:=false else if f[i][i2+1]=true then f[i][i2+1]:=false;
   end;
 write(d);
end.

