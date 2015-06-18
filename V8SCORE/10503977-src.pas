program v8score;
uses crt;
var s, k, n, i, i2: byte;
    a: array [1..20, 1..20] of byte;
    b: array [1..100] of longint;
    boo: boolean;
procedure process;
 var i: longint;
 begin
  writeln('YES');
  for i:=1 to k-1 do
   write(b[i], ' ');
  write(b[k]);
  fillchar(b, sizeof(b), 0);
 end;
procedure try(x, t: longint);
 var i: longint;
 begin
  for i:=1 to n do
   if t+a[i][x]<=s then begin
    b[x]:=a[i][x];
    t:=t+a[i][x];
    if (t=s) and (x=k) and not(boo) then begin
     process;
     boo:=true;
     exit;
    end else
     if (t<s) and (x<k) then try(x+1, t);
    t:=t-a[i][x];
   end;
 end;
begin
 fillchar(b, sizeof(b), 0);
 fillchar(a, sizeof(a), 0);
 boo:=false;
 readln(s, k, n);
 for i:=1 to n do
  for i2:=1 to k do
   read(a[i][i2]);
 try(1, 0);
 if not(boo) then write('NO');
end.
