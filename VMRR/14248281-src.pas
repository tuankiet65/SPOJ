program vmrr;
var s: widestring;
    a: array [1..1000001] of longint;
    s2: string;
    x, y: char;
    i: longint;
    n: int64;
begin
 fillchar(a, sizeof(a), 0);
 readln(s);
 readln(s2);
 x:='a';
 y:='a';
 for i:=length(s) downto 1 do begin
  a[i]:=a[i+1];
  if s[i]=y then inc(a[i]);
 end;
 n:=0;
 for i:=1 to length(s)-1 do begin
  if s[i]=x then
   if s[i]<>y then
    n:=n+a[i]
   else
    n:=n+a[i]-1;
 end;
 writeln(n);
end.
