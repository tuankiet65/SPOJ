program bignum;
uses crt;
const c2n: array ['0'..'9'] of byte=(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      n2c: array [0..9] of char=('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
var a, b, mplyres: ansistring;
    i: longint;
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
   if (c2n[a[i]]+c2n[b[i]]+re)<10 then begin
    s:=s+n2c[c2n[a[i]]+c2n[b[i]]+re];
    re:=0;
   end else begin
    s:=s+n2c[(c2n[a[i]]+c2n[b[i]]+re) mod 10];
    re:=(c2n[a[i]]+c2n[b[i]]+re) div 10;
   end;
  if re<>0 then s:=s+n2c[re];
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
   if c2n[a[i]]*c2n[b]+re<10 then begin
    s:=s+n2c[c2n[a[i]]*c2n[b]+re];
    re:=0;
   end else begin
    s:=s+n2c[(c2n[a[i]]*c2n[b]+re) mod 10];
    re:=(c2n[a[i]]*c2n[b]+re) div 10;
   end;
  if re<>0 then s:=s+n2c[re];
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
 mplyres:='';
 for i:=length(b) downto 1 do
  mplyres:=plus(mplyres, mply(a, b[i], length(b)-i));
 //writeln(minus(a, b));
 write(mplyres);
 readln;
end.

