program vratf;
var n, k, d: longint;
procedure try(n: longint);
 begin
  if ((n+k) mod 2=0) and (n>k) then begin
   inc(d);
   try((n+k) div 2);
   try(((n+k) div 2)-k);
  end;
 end;
begin
 d:=1;
 readln(n, k);
 try(n);
 writeln(d);
end.
