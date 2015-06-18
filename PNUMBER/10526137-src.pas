program prime;
uses crt;
var a, b, i: longint;
function prime(n: longint): boolean;
 var i: longint;
 begin
  prime:=true;
  if n=1 then exit(false);
  for i:=2 to round(sqrt(n)) do
   if n mod i=0 then exit(false);
 end;
begin
 readln(a,b);
 for i:=a to b do
  if prime(i)=true then
   writeln(i);
end.


