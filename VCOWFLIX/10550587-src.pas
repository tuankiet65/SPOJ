program vcowflix;
uses crt;
var a: array [1..16] of longint;
    b: array [1..16] of boolean;
    c, n, i, maxt: integer;
procedure try(k, t: integer);
 var i: integer;
 begin
  for i:=1 to n do
   if not(b[i]) then begin
    t:=t+a[i];
    b[i]:=true;
    if (t<=c) and (t>maxt) then maxt:=t;
    if t<=c then try(k+1, t);
    t:=t-a[i];
    b[i]:=false;
   end;
 end;
begin
 fillchar(b, sizeof(b), false);
 readln(c, n);
 maxt:=0;
 for i:=1 to n do readln(a[i]);
 try(1, 0);
 write(maxt);
end.