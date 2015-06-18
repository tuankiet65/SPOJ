program vratf;
var n, k, d: longint;
procedure try(n: longint);
 begin
  if ((n+k) mod 2=0) and ((n+k) div 2<>k) then begin
   try((n+k) div 2);
   try(((n+k) div 2)-k);
  end else inc(d);
 end;
begin
 d:=0;
 readln(n, k);
 if k=0 then begin
  writeln(n);
  exit();
 end; 
 try(n);
 writeln(d);
end.
