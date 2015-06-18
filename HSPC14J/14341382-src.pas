program hspc14j;
var n, k: longint;
    t: text;
function eratos(n, k: longint): longint;
 var p: array [1..1000] of boolean;
     i, d, i2: longint;
 begin
  d:=0;
  fillchar(p, sizeof(p), true);
  for i:=2 to n do
   if p[i] then
    for i2:=1 to n div i do begin
     if p[i*i2] then
      inc(d);
     if d=k then exit(i*i2);
     p[i*i2]:=false;
    end;
 end;
begin
 assign(t, '');
 reset(t);
 while not eof(t) do begin
  readln(t, n, k);
  writeln(eratos(n, k));
 end;
end.