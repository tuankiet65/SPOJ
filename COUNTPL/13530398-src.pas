program countpl;
var a: array [0..255] of longint;
    s: string;
    i, i2, i3: longint;
function ispalin(s: string): boolean;
 var s2: string;
     i: longint;
 begin
  s2:='';
  for i:=length(s) downto 1 do
   s2:=s2+s[i];
  ispalin:=(s=s2); 
 end;
function min(a, b: longint): longint;
 begin
  if a>b then min:=b else min:=a;
 end;
begin
 readln(s);
 for i:=1 to length(s) do
  a[i]:=i;
 for i:=1 to length(s) do
  for i2:=i downto 1 do
   if ispalin(copy(s, i2, i-i2+1)) then a[i]:=min(a[i],a[i2+1]+1);
 writeln(a[length(s)]);
end.

