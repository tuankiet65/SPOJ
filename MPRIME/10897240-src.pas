program mprime;
uses math;
const num=182549;
var a: array [1..100000] of longint;
    b, c: array [1..10000] of qword;
    nump, n: longint;
procedure sieve;
 var p: array [2..num] of boolean;
     i, i2: longint;
 begin
  fillchar(p, sizeof(p), true);
  for i:=2 to trunc(sqrt(num)) do begin
   if p[i]=true then begin
    i2:=0;
    while (i**2)+(i2*i)<num do begin
     p[(i**2)+(i2*i)]:=false;
     inc(i2);
    end;
   end;
  end;
  i2:=0;
  for i:=2 to num do
   if p[i]=true then begin
    inc(i2);
    a[i2]:=i;
   end;
  nump:=i2;
 end;
procedure primeplus;
 var i, i2: longint;
     c, d: string;
     e: integer;
 begin
  i:=0;
  i2:=0;
  while i<nump do begin
   inc(i, 2);
   str(a[i-1], c);
   str(a[i], d);
   c:=c+d;
   inc(i2);
   val(c, b[i2], e);
  end;
  nump:=i2;
 end;
function isprime(n: qword): boolean;
 var i: qword;
 begin
  i:=2;
  while i<=trunc(sqrt(n)) do begin
   if n mod i=0 then exit(false);
   inc(i);
  end;
  exit(true);
 end;
procedure sieve2;
 var i, i2: longint;
 begin
  i2:=0;
  for i:=1 to nump do
   if isprime(b[i]) then begin
    inc(i2);
    c[i2]:=b[i];
    if i2=n then begin
     write(c[n]);
     exit;
    end;
   end;
 end;
begin
 sieve;
 primeplus;
 readln(n);
 if n<=0 then begin
  write(0);
  exit;
 end;
 sieve2;
end.