program nkabd;
uses crt;
var l, r, i, d: longint;
function pp(n: longint): Int64;
 var i : longint;
     T:Int64;
 begin
  t:=0;
  if (n=1) or (n=0) then exit(0);
  for i:=1 to trunc(sqrt(n)) do
   if n mod i=0 then t:=t+i+(n div i);
 pp:=t-n;
 if i=sqrt(n) then pp:=pp-i;
 end;
begin
 read(l, r);
 for i:=l to r do
  if pp(i)>i then
   inc(d);
 write(d);
end.

