program dhtable2;
const table: array [1..16] of int64=(
9,
180,
2700,
36000,
450000,
5400000,
63000000,
720000000,
8100000000,
90000000000,
990000000000,
10800000000000,
117000000000000,
1260000000000000,
13500000000000000,
144000000000000000);
var i: longint;
    t, n: int64;
function calc(n: int64): char;
 var i, num, pos: int64;
     s: string;
 begin
  i:=1;
  if n<=0 then exit(' '); 
  while table[i]<n do begin
   n:=n-table[i];
   inc(i);
  end;
  num:=(table[i] div (9*i))+(n div i)-1;
  if n mod i<>0 then
   num:=num+1;
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
