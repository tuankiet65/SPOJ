program vosmaxk;
var a: array [1..1000000] of longint;
    i, n, k, old: longint;
    res: qword;
function calc(l, r, n: qword): qword; inline;
 begin
  calc:=(r-n+1)*(n-l+1);
 end;
function process(l, r: longint): qword;
 var i, pos: longint;
 begin
  process:=0;
  pos:=l;
  for i:=l to r do
   if a[i]=k then begin
    process:=process+calc(qword(pos), qword(r), qword(i));
    pos:=i+1;
   end;
 end;
begin
 readln(n, k);
 for i:=1 to n do
  read(a[i]);
 old:=1;
 res:=0;
 for i:=2 to n do
  if a[i]>k then begin
   res:=res+process(old, i-1);
   old:=i+1;
  end;
 res:=res+process(old, n);
 writeln(res);
end.
