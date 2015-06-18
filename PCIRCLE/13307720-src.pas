program pcircle;
const prime: set of byte=[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37];
var a: array [1..20] of byte;
    b: array [1..100] of boolean;
    n, d, i, i2: integer;
    res: array [1..10000, 1..20] of byte;
    flag: boolean=false;
procedure try(k: byte);
 var i: byte;
 begin
  for i:=2 to 2*n do
   if (a[k-1]+i in prime) and not(b[i]) then begin
    b[i]:=true;
    a[k]:=i;
    if k=n*2 then begin
     if (a[n*2]+1 in prime) then begin
      inc(d);
      res[d]:=a;
     end;
     if d=10000 then flag:=true;
    end else try(k+1);
    if flag then exit();
    b[i]:=false;
   end;
 end;
begin
 d:=0;
 readln(n);
 a[1]:=1;
 try(2);
 writeln(d);
 for i:=1 to d do begin
  for i2:=1 to 2*n do write(res[i][i2], ' ');
  writeln();
 end;
end.
