program qbseq;
var a: array [1..1000] of longint;
    b: array [0..1000] of qword;
    n, i, k, max, i2: longint;
begin
 readln(n, k);
 b[0]:=0;
 for i:=1 to n do begin
  read(a[i]);
  b[i]:=b[i-1]+a[i];
 end;
 for i:=1 to n do
  for i2:=i to n do
   if ((b[i2]-b[i-1]) mod k=0) and (i2-i+1>max) then max:=i2-i+1;
 write(max);
end.
