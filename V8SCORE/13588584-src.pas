program v8score;
var s, k, n, i, i2: longint;
    a: array [1..20, 1..20] of longint;
    b: array [0..20] of longint;
    boo: boolean=false;
procedure process();
 var i: longint;
 begin
  writeln('YES');
  for i:=1 to k do
   write(b[i], ' ');
  boo:=true;
 end;
procedure try(t, x: longint);
 var i: longint;
 begin
  for i:=1 to n do
   if (a[i][t]>=b[t-1]) and (a[i][t]+x<=s) and not(boo) then begin
    b[t]:=a[i][t];
    if (t=k) and (x+b[t]=s) then
     process()
    else if (t<k) and (x<s) then
     try(t+1, x+b[t]);
   end;
 end;
begin
 b[0]:=-maxlongint;
 readln(s, k, n);
 for i:=1 to n do begin
  for i2:=1 to k do
   read(a[i][i2]);
  readln();
 end;
 try(1, 0);
 if not(boo) then write('NO');
end.