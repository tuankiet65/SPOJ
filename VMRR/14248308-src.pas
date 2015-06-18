program vmrr;
var s: ansistring;
    a: array [1..1000001] of longint;
    s2: string;
    x, y: char;
    i: longint;
    n: int64;
begin
 fillchar(a, sizeof(a), 0);
 readln(s);
 readln(s2);
 x:=s2[1];
 y:=s2[2];
 for i:=length(s)-1 downto 1 do begin
  a[i]:=a[i+1];
  if s[i+1]=y then
   a[i]:=a[i+1]+1
 end;
 n:=0;
 for i:=1 to length(s)-1 do begin
  if s[i]=x then
   n:=n+a[i];
 end;
 writeln(n);
end.
