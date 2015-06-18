program dhtable2;
uses math;
var i: longint;
    t, n: int64;
function calc(n: int64): char;
 var i, num, pos: int64;
     s: string;
 begin
  i:=1;
  while i*9*(10**(i-1))<n do begin
   n:=n-(i*9*(10**(i-1)));
   inc(i);
  end;
  num:=10**(i-1)+ceil(n/i)-1;
  pos:=n mod i;
  if pos=0 then pos:=i;
  str(num, s);
  exit(s[pos]);
 end;
begin
 readln(n, t);
 for i:=1 to n do
  write(calc(t-n+i));
end.
