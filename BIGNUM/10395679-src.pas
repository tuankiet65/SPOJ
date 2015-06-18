program bignum;
uses crt;
var a, b, mplyres: ansistring;
    i: longint;
function c2n(c: char): byte;
 begin
  case c of
   '0': c2n:=0;
   '1': c2n:=1;
   '2': c2n:=2;
   '3': c2n:=3;
   '4': c2n:=4;
   '5': c2n:=5;
   '6': c2n:=6;
   '7': c2n:=7;
   '8': c2n:=8;
   '9': c2n:=9;
  end;
 end;
function n2c(n: byte): char;
 begin
  case n of
   0: n2c:='0';
   1: n2c:='1';
   2: n2c:='2';
   3: n2c:='3';
   4: n2c:='4';
   5: n2c:='5';
   6: n2c:='6';
   7: n2c:='7';
   8: n2c:='8';
   9: n2c:='9';
  end;
 end;
procedure strstd(var s: ansistring);
 begin
  while s[1]='0' do
   delete(s, 1, 1);
 end;
function plus(a, b: ansistring): ansistring;
 var re, i: integer;
     s, s2: ansistring;
 begin
  re:=0;
  s:='';
  s2:='';
  if length(a)>length(b) then
   for i:=1 to length(a)-length(b) do b:='0'+b;
  if length(b)>length(a) then
   for i:=1 to length(b)-length(a) do a:='0'+a;
  for i:=length(a) downto 1 do
   if (c2n(a[i])+c2n(b[i])+re)<10 then begin
    s:=s+n2c(c2n(a[i])+c2n(b[i])+re);
    re:=0;
   end else begin
    s:=s+n2c((c2n(a[i])+c2n(b[i])+re) mod 10);
    re:=(c2n(a[i])+c2n(b[i])+re) div 10;
   end;
  if re<>0 then s:=s+n2c(re);
  for i:=length(s) downto 1 do
   s2:=s2+s[i];
  strstd(s);
  plus:=s2;
 end;
function mply(a: ansistring; b: char; c: longint): ansistring;
 var re: byte;
     i: longint;
     s: ansistring;
 begin
  mply:='';
  re:=0;
  if b='0' then begin
   mply:='0';
   exit;
  end;
  for i:=length(a) downto 1 do
   if c2n(a[i])*c2n(b)+re<10 then begin
    s:=s+n2c(c2n(a[i])*c2n(b)+re);
    re:=0;
   end else begin
    s:=s+n2c((c2n(a[i])*c2n(b)+re) mod 10);
    re:=(c2n(a[i])*c2n(b)+re) div 10;
   end;
  if re<>0 then s:=s+n2c(re);
  for i:=length(s) downto 1 do
   mply:=mply+s[i];
  if c<>0 then
   for i:=1 to c do
    mply:=mply+'0';
  strstd(mply);
 end;
begin
 readln(a);
 readln(b);
 writeln(plus(a, b));
 //writeln(minus(a, b));
 mplyres:='';
 for i:=length(b) downto 1 do
  mplyres:=plus(mplyres, mply(a, b[i], length(b)-i));
 writeln(mplyres);
 readln;
end.