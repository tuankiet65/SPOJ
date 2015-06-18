program mincut;
var t, tout: text;
    a, b, c: array [0..1000, 0..1000] of longint;
    //b: horizontal; c: vertical
    i, n, k, m, i2, x, y, u, v, sr, sr2, min: longint;
procedure precalculate(m, n: longint);
 var i, i2: longint;
 begin
  for i:=1 to m do
   for i2:=1 to n do
    b[i][i2]:=b[i][i2-1]+a[i][i2];
  for i:=1 to n do
   for i2:=1 to m do
    b[i2][i]:=b[i2][i-1]+a[i][i2];
 end;
function sum_rect(x, y, u, v: longint): longint;
 var i: longint;
 begin
  sum_rect:=0;
  for i:=x to u do
   sum_rect:=sum_rect+(b[i][v]-b[i][x-1]);
 end;
begin
 fillchar(b, sizeof(b), 0);
 {$IFDEF ONLINE_JUDGE}
 assign(t, '');
 assign(tout, '');
 {$ELSE}
 assign(t, 'MINCUT.INP');
 assign(tout, 'MINCUT.OUT');
 {$ENDIF}
 reset(t);
 rewrite(tout);
 readln(t, m, n, k);
 for i:=1 to m do begin
  for i2:=1 to n do
   read(t, a[i][i2]);
  readln(t);
 end;
 precalculate(m, n);
 for i:=1 to k do begin
  min:=maxlongint;
  readln(t, x, y, u, v);
  sr:=sum_rect(x, y, u, v);
  sr2:=0;
  for i2:=x to u do begin
   sr2:=sr2+b[i2][v]-b[i2][y-1];
   if abs(sr-2*sr2)<min then
    min:=abs(sr-2*sr2);
  end;
  sr2:=0;
  for i2:=y to v do begin
   sr2:=sr2+b[u][i2]-b[x-1][i2];
   if abs(sr-2*sr2)<min then
    min:=abs(sr-2*sr2);
  end;
  writeln(tout, min);
 end;
 close(t);
 close(tout);
end.