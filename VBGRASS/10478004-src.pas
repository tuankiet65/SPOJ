program vbgrass;
uses crt;
const x: array [1..4] of integer=(-1, 0, 1, 0);
      y: array [1..4] of integer=(0, 1, 0, -1);
var f: array [0..101, 0..101] of boolean;
    r, c, i, i2: byte;
    d: int64;
    tmp: string;
procedure erase(a, b: byte);
 var i: byte;
 begin
  for i:=1 to 4 do
   if f[a+x[i], b+y[i]]=true then begin
    f[a+x[i], b+y[i]]:=false;
    erase(a+x[i], b+y[i]);
   end;
 end;
begin
 fillchar(f, sizeof(f), false);
 readln(r);
 readln(c);
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
    erase(i, i2);
   end;
 write(d);
end.