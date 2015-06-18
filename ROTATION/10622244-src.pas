program rotation;
var a: array [1..1000] of byte;
    n, i, tmp1, tmp2, tmp3, state: longint;
begin
 state:=0;
 readln(n);
 for i:=1 to n-1 do begin
  readln(tmp1, tmp2, tmp3);
  a[tmp1]:=tmp3;
 end;
 for i:=2 to n do
  if a[i-1]=1 then
   case state of
    0: state:=1;
    1: state:=0;
   end;
 write(state);
end.