program c11cal;
const m: qword=1000000007;
var n, k, res: qword;
    i: longint;
    t: text;
function expo(a, b, m: qword): qword;
 var i: longint;
 begin
  expo:=1;
  for i:=1 to longint(b) do
   expo:=(expo*a) mod m;
 end;
begin
 assign(t, '');
 reset(t);
 repeat
  readln(n, k);
  res:=0;
  for i:=1 to longint(n) do
   res:=(res+expo(i, k, m)) mod m;
  writeln(res);
 until eof(t);
 close(t);
end.
