program findnum;
uses math;
const prime: array [1..11] of longint=(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31);
var n: longint;
    a: array [1..11] of longint;
    min: qword;
procedure check;
 var i: longint;
     tmp: qword;
 begin
  tmp:=1;
  for i:=1 to 11 do
   if a[i]<>0 then
    tmp:=tmp*(prime[i]**(a[i]-1));
  if tmp<min then min:=tmp;
 end;
procedure try(k, n: longint);
 var i: longint;
 begin
  for i:=2 to trunc(sqrt(n)) do begin
   if n mod i=0 then begin
    a[k]:=i;
    a[k+1]:=n div i;
    check;
    try(k+1, n div i);
    a[k+1]:=0;
   end;
  end;
 end;
begin
 read(n);
 min:=high(qword);
 try(1, n);
 write(min);
end.