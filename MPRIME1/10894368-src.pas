program mprime1;
var a: array [1..1335] of longint;
    n: longint;
function isprime(n: longint): boolean;
 var i: longint;
 begin
  for i:=2 to trunc(sqrt(n)) do
   if n mod i=0 then exit(false);
  exit(true);
 end;
procedure sinh;
 var i, i2: longint;
 begin
  i2:=0;
  for i:=2 to 11000 do
   if isprime(i) then begin
    inc(i2);
    a[i2]:=i;
   end;
 end;
function find(n: longint): longint;
 var i, i2, i3: longint;
     tmp: qword;
 begin
  tmp:=0;
  find:=0;
  if isprime(n) then inc(find);
  for i:=1 to 1334 do
   for i2:=i+1 to 1335 do begin
    if (a[i]<n) and (a[i2]<n) then
     for i3:=i to i2 do tmp:=tmp+a[i3];
    if tmp=n then inc(find);
    tmp:=0;
   end;
 end;
begin
 sinh;
 repeat
  readln(n);
  if n<>0 then writeln(find(n));
 until n=0;
end.
