program prime;
uses crt;
var a,b, i: longint;
function prime(n: longint): boolean;
 var i: longint;
 begin
  prime:=true;
  for i:=2 to round(sqrt(n)) do
   if n mod i=0 then begin
    prime:=false;
    exit;
   end;
 end;
begin
 readln(a,b);
 for i:=a to b do
  if prime(i)=true then
   writeln(i);
end.


