program vsteps;
var a: array [1..100000] of longint;
    b: array [1..100000] of boolean;
    k, i, n, x: longint;
begin
 fillchar(a, sizeof(a), 0);
 fillchar(b, sizeof(b), false);
 readln(n, k);
 for i:=1 to k do begin
  read(x);
  b[x]:=true;
 end;
 a[1]:=1;
 if not(b[2]) then
  a[2]:=2;
 for i:=3 to n do
  if b[i] then
   a[i]:=(a[i-1]+a[i-2]) mod 14062008;
 writeln(a[n]);
end.