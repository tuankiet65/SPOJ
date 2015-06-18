program countcbg;
var n: longint;
    t: text;
function process(n: longint): longint;
 var x: longint;
     y: extended;
 begin
  process:=0;
  for x:=1 to (n div 2) do begin
   y:=n/(x+1)-(x/2);
   if trunc(y)=0 then exit();
   if trunc(y)=y then inc(process);
  end;
 end;
begin
 assign(t, '');
 reset(t);
 writeln(process(45));
 while not eof(t) do begin
  readln(t, n);
  writeln(process(n));
 end;
 close(t);
end.
