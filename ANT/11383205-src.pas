{$MAXSTACKSIZE $7FFFFFF$7FFFFFF}
program ant;
var n, m: int64;
function jose(m, n: int64): int64;
 var k, l: int64;
 begin
  if n=1 then exit(1);
  if n<=m then exit(((jose(m, n-1)+m-1) mod n)+1);
  k:=jose(m, n-(n div m));
  if k<=(n mod m) then exit(k+n-(n mod m));
  l:=k-(n mod m);
  jose:=l+((l-1) div (m-1));
 end;
begin
 readln(n, m);
 writeln(jose(m, n));
end.
