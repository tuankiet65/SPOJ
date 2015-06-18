program mcityhal;
var a: array [0..201, 0..201] of boolean;
    b: array [1..200] of longint;
    m, n, i, i2: longint;
    s: string;
function follow(i, i2: longint): longint;
 begin
  follow:=0;
  while not(a[i][i2]) do begin
   inc(follow);
   a[i][i2]:=true;
   inc(i);
  end;
 end;
begin
 fillchar(b, sizeof(b), 0);
 fillchar(a, sizeof(a), true);
 readln(m, n);
 for i:=1 to m do begin
  readln(s);
  for i2:=1 to n do
   if s[i2]='0' then a[i][i2]:=false;
 end;
 for i:=1 to m do
  for i2:=1 to n do
   if not(a[i][i2]) then inc(b[follow(i, i2)]);
 for i:=1 to 200 do
  if b[i]<>0 then writeln(i, ' ', b[i]);
end.
