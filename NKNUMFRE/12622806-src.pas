program stt;
var b, i, d, a: longint;
function rev(n: longint): longint;
 begin
  rev:=0;
  while n<>0 do begin
   rev:=rev*10+(n mod 10);
   n:=n div 10;
  end;
 end;
function ucln(a, b: longint): longint;
 var t: longint;
 begin
  while b<>0 do begin
   t:=a mod b;
   a:=b;
   b:=t;
  end;
  ucln:=a;
 end;
begin
 //write('Nhap a: ');
 readln(a, b);
 //write('Nhap b: ');
 //readln(b);
 for i:=a to b do
  if ucln(i, rev(i))=1 then inc(d);
 write(d);
end.
