program nkedit;
var d, k: longint;
    s, p: string;
function edit(var s, p: string; k: longint): boolean;
 var i, tmp, i2: longint;
 begin
  for i:=1 to length(s)-k+1 do
   for i2:=k to length(s)-i+1 do begin
    tmp:=pos(copy(s, i, i2), p);
    if tmp<>0 then begin
     delete(s, i, i2);
     delete(p, tmp, i2);
     exit(true);
    end;
   end;
  exit(false);
 end;
begin
 d:=0;
 readln(k);
 readln(s);
 readln(p);
 while edit(s, p, k) do
  inc(d);
 writeln(d);
 writeln(s);
 writeln(p);
end.