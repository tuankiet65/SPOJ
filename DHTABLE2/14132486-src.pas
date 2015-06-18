program dhtable2;
uses math;
var t, i, n: longint;
function calc(n: int64): char;
 var i, num, pos: longint;
     s: string;
 begin
  i:=0;
  while 9*(10**i)<n do begin
   n:=n-(9*(10**i));
   i:=i+1;
  end;
  num:=10**i+ceil(n/(i+1))-1;
  pos:=n mod (i+1);
  if pos=0 then pos:=i+1;
  str(num, s);
  exit(s[pos]);
 end;
begin
 readln(n, t);
 for i:=1 to n do
  write(calc(t-n+i));
end.
