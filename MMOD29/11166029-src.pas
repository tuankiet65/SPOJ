program mmod29;
uses math;
const d=29;
var x: int64;
    a: array [1..3] of int64;
function sumdiv(p, a, m: int64): int64;
 begin
  if (a<=8) then sumdiv:=(p**a) mod m else
   sumdiv:=((sumdiv(p, a div 2, m) mod m)**2*ifthen(a mod 2<>0, p, 1)) mod m;
 end;
begin
 while true do begin
  readln(x);
  if x=0 then exit;
  a[1]:=sumdiv(2, 2*x+1, d)-1;
  a[2]:=(sumdiv(3, x+1, d*2)-1) div 2 mod d;
  a[3]:=(sumdiv(167, x+1, d*166)-1) div 166 mod d;
  writeln((a[1]*a[2]*a[3]) mod d);
 end;
end.