program palindr;
var t: text;
    s: string;
    i, d: longint;
    a: array [1..255] of string;
function ispalin(f, t: longint): boolean;
 var i: longint;
 begin
  for i:=f to t div 2 do
   if s[i]<>s[t+1-i] then exit(false);
  ispalin:=true;
 end;
begin
 assign(t, '');
 reset(t);
 readln(t, s);
 close(t);
 d:=0;
 while s<>'' do begin
  for i:=length(s) downto 1 do
   if ispalin(1, i) then begin
    //inc(d);
    //a[d]:=copy(s, 1, i);
    delete(s, 1, i);
    break;
   end;
 end;
 assign(t, '');
 rewrite(t);
 writeln(t, d);
 //for i:=1 to d do
 // writeln(t, a[i]);
 close(t);
end.
