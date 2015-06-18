program palindr;
var t: text;
    s, s2: string;
    i, d, d2: longint;
    a, b: array [1..255] of string;
function ispalin(f, t: longint): boolean;
 var i: longint;
 begin
  for i:=f to t do
   if s[i]<>s[t-i+f] then exit(false);
  ispalin:=true;
 end;
begin
 assign(t, '');
 reset(t);
 readln(t, s);
 close(t);
 d:=0;
 s2:=s;
 ispalin(5, 10);
 while s2<>'' do begin
  for i:=length(s2) downto 1 do
   if ispalin(1, i) then begin
    inc(d);
    a[d]:=copy(s2, 1, i);
    delete(s2, 1, i);
    break;
   end;
 end;
 s2:=s;
 d2:=0;
 while s2<>'' do begin
  for i:=1 to length(s2) do
   if ispalin(i, length(s2)) then begin
    inc(d2);
    b[d2]:=copy(s2, i, length(s2)-i+1);
    delete(s2, i, length(s2)-i+1);
    break;
   end;
 end;
 assign(t, '');
 rewrite(t);
 if d<d2 then begin
  writeln(t, d);
  //for i:=1 to d do
   //writeln(t, a[i]);
 end else begin
  writeln(t, d2);
  //for i:=d2 downto 1 do
   //writeln(t, b[i]);
 end;
 close(t);
end.