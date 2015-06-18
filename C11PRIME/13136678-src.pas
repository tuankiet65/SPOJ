program c11prime;
uses math;
var n: int64;
    i: longint;
function is_prime(n: longint): boolean;
 var i: longint;
 begin
  if n<2 then exit(false);
  for i:=2 to trunc(sqrt(n)) do
   if n mod i=0 then exit(false);
  is_prime:=true;
 end;
begin
 readln(n);
 if n<=2 then begin
  write(0);
  exit();
 end;
 for i:=2 to 63 do
  if (trunc(n**(1/i))**i)=n then
   if is_prime(trunc(n**(1/i))) then begin
    write(trunc(n**(1/i)), ' ', i);
    exit();
   end;
 write(0);
end.
