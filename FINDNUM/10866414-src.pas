program findnum;
uses math;
const prime: array [1..10] of qword=(2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
var n: longint;
    a: array [1..10] of qword;
    min: qword;
procedure check;
 var i: longint;
     tmp: qword;
 begin
  tmp:=1;
  for i:=1 to 10 do
   if (a[i]>0) and (a[i]<64) then begin
    tmp:=tmp*(prime[i]**(a[i]-1));
    if (tmp>min) then break;
   end;
  if (tmp<min) and (tmp<>1) then min:=tmp;
 end;
procedure try(k, n: longint);
 var i: longint;
 begin
  for i:=n downto 2 do begin
   if n mod i=0 then begin
    a[k]:=i;
    a[k+1]:=n div i;
    check;
    if k<10 then try(k+1, n div i);
    a[k+1]:=0;
   end;
  end;
 end;
begin
 read(n);
 min:=1000000000000000000;
 try(1, n);
 write(min);
end.