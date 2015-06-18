program wordcnt;
uses crt;
type arr=array [1..1000] of string;
var n, i, dem: longint;
    a, b: array [1..1000] of string;
procedure split(s: string; var a: arr; var i: longint);
 var k: longint;
 begin
  i:=0;
  repeat
   k:=pos(' ', s);
   inc(i);
   a[i]:=copy(s, 1, k-1);
   if k<>0 then delete(s, 1, k) else begin
    a[i]:=s;
    delete(s, 1, length(s));
   end;
  until s='';
 end;
function process(n: longint): longint;
 var ar: array [1..20] of longint;
     i: longint;
 begin
  process:=-32767;
  fillchar(ar, sizeof(ar), 0);
  for i:=1 to n do
   inc(ar[length(b[i])]);
  for i:=1 to 20 do if ar[i]>process then process:=ar[i];
 end;
begin
 readln(n);
 for i:=1 to n do begin
  readln(a[i]);
 end;
 for i:=1 to n do begin
  split(a[i], b, dem);
  write(process(dem));
 end;
end.
