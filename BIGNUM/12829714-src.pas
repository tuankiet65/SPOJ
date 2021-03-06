type bignum=array [0..20000] of longint;
var a, b, res: bignum;
    s, s2: widestring;
    i: longint;
    minus: boolean=false;
function max(a, b: longint): longint;
 begin
  if a>b then max:=a else max:=b;
 end;
procedure bignumInit(var a: bignum; s: widestring);
 const c2n: array ['0'..'9'] of longint=(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
 var i, i2: longint;
 begin
  fillchar(a, sizeof(a), 0);
  a[0]:=length(s);
  i2:=a[0];
  for i:=1 to a[0] do begin
   a[i]:=c2n[s[i2]];
   dec(i2);
  end;
 end;
procedure bignumPlus(a, b: bignum; var c: bignum);
 var i, re: longint;
 begin
  fillchar(c, sizeof(c), 0);
  re:=0;
  for i:=1 to max(a[0], b[0])+1 do begin
   c[i]:=(a[i]+b[i]+re) mod 10;
   re:=(a[i]+b[i]+re) div 10;
  end;
  if c[i]<>0 then c[0]:=i else c[0]:=i-1;
 end;
procedure bignumOutput(a: bignum; minus: boolean);
 var i: longint;
 begin
  if minus then write('-');
  for i:=a[0] downto 1 do
   write(a[i]);
  writeln();
 end;
function bignumCmp(a, b: bignum): boolean;
 var i: longint;
 begin
  for i:=max(a[0], b[0]) downto 1 do
   if a[i]<b[i] then exit(true);
  bignumCmp:=false;
 end;
procedure bignumMinus(a, b: bignum; var c: bignum);
 var i, re, tmp2: longint;
 begin
  if bignumCmp(a, b) then begin
   res:=a;
   a:=b;
   b:=res;
   minus:=true;
  end;
  fillchar(res, sizeof(res), 0);
  re:=0;
  for i:=1 to max(a[0], b[0])+1 do begin
   tmp2:=a[i];
   if tmp2-b[i]<0 then inc(tmp2, 10);
   c[i]:=(tmp2-b[i]) mod 10;
   re:=(tmp2-b[i]) div 10;
  end;
  if c[i]<>0 then c[0]:=i else c[0]:=i-1;
 end;
begin
 readln(s);
 readln(s2);
 bignumInit(a, s);
 bignumInit(b, s2);
 bignumPlus(a, b, res);
 bignumOutput(res, false);
 bignumMinus(a, b, res);
 bignumOutput(res, minus);
end.
