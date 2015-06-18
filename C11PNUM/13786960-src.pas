program c11pnum;
const MAX_QWORD: qword=18446744073709551615;
var n, k, res: qword;
    p: array [0..6542] of longint;
    t, i: longint;
procedure sieve();
 var i, i2: longint;
     b: boolean;
 begin
  for i:=2 to 65533 do begin
   b:=true;
   for i2:=2 to trunc(sqrt(i)) do
    if i mod i2=0 then begin
     b:=false;
     break;
    end;
   if b then begin
    inc(p[0]);
    p[p[0]]:=i;
   end;
  end;
 end;
function isprime(n: qword): boolean;
 var i: longint;
 begin
  i:=1;
  if n<2 then exit(false);
  while (p[i]<n) do begin
   if n mod p[i]=0 then
    exit(false);
   if (i<p[0]) then inc(i) else break;
  end;
  isprime:=true;
 end;
function findprime(n: qword; s: longint): qword;
 begin
  repeat
   if s=1 then inc(n) else dec(n);
  until isprime(n);
  findprime:=n;
 end;
function max(a, b: qword): qword;
 begin
  if a>b then max:=a else max:=b;
 end;
function proc(n: qword; k: qword): qword;
 var a: array [-100..100] of qword;
     post, posb, i, i2: longint;
     f: boolean=false;
 begin
  post:=0;
  posb:=0;
  //fillchar(a, sizeof(a), 0);
  if n=0 then exit(0);
  a[0]:=findprime(max(trunc(exp((1/k)*ln(n))), 3), -1);
  proc:=a[0];
  for i:=2 to k do begin
   if a[posb]=2 then begin
    for i2:=i to k do begin
     dec(post);
     a[post]:=findprime(a[post+1], 1);
     proc:=proc*a[post];
    end;
    break;
   end;
   inc(posb);
   a[posb]:=findprime(a[posb-1], -1);
   proc:=proc*a[posb];
  end;
  if proc>n then exit(0);
  while not(f) do begin
   dec(post);
   a[post]:=findprime(a[post+1], 1);
   if (proc div a[posb])<=(MAX_QWORD/a[post]) then begin
    if (proc div a[posb])*a[post]<=n then begin
     proc:=(proc div a[posb])*a[post];
     dec(posb);
    end else f:=true;
   end else f:=true;
  end;
 end;
begin
 sieve();
 readln(t);
 for i:=1 to t do begin
  readln(n, k);
  res:=proc(n, k);
  if res=0 then
   writeln(-1)
  else
   writeln(res);
 end;
end.