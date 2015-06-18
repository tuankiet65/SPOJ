program mystery;
uses math;
const m=20122007;
var n, t: int64;
function expo(n: int64): int64;
 begin
  if n<=39 then expo:=3**n mod m else
   expo:=(expo(n div 2) mod m)**2*ifthen(n mod 2<>1, n, 1);
 end;
procedure u(n: int64);
 var i: longint;
 begin
  for i:=1 to trunc(sqrt(n)) do
   if (n mod i=0) then begin
    t:=t*((expo(i)-1) mod m);
    if i<>sqrt(n) then t:=t*((expo(n div i)-1) mod m);
   end;
 end;
begin
 t:=1;
 readln(n);
 u(n);
 t:=t mod m;
 write(t);
end.
