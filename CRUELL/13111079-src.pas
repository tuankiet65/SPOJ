program cruell;
type bignum=array [0..15000] of integer;
const lut1: array [0..19] of integer=(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      lut2: array [0..19] of integer=(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
var a, b, res: bignum;
    p, i, n: longint;
    lutmul1, lutmul2: array [0..89] of longint;
function max(a, b: longint): longint;
 begin
  if a>b then max:=a else max:=b;
 end;
procedure bignumInit(var a: bignum; n: longint);
 begin
  fillchar(a, sizeof(a), 0);
  while n<>0 do begin
   inc(a[0]);
   a[a[0]]:=n mod 10;
   n:=n div 10;
  end;
 end;
procedure bignumPlus(a, b: bignum; var c: bignum);
 var i, re: integer;
 begin
  fillchar(c, sizeof(c), 0);
  re:=0;
  for i:=1 to max(a[0], b[0])+1 do begin
   c[i]:=lut1[a[i]+b[i]+re];
   re:=lut2[a[i]+b[i]+re];
  end;
  if c[i]<>0 then c[0]:=i else c[0]:=i-1;
 end;
procedure bignumMultiplyOne(a: bignum; b: integer; var c: bignum; offset: integer);
 var i, re: integer;
 begin
  fillchar(c, sizeof(c), 0);
  re:=0;
  if b=0 then exit();
  for i:=1 to a[0]+1 do begin
   c[i+offset]:=lutmul1[a[i]*b+re];
   re:=lutmul2[a[i]*b+re];
  end;
  if c[i+offset]<>0 then c[0]:=i+offset else c[0]:=i+offset-1;
 end;
procedure bignumMultiply(a, b: bignum; var c: bignum);
 var tmp: bignum;
     i: longint;
 begin
  fillchar(c, sizeof(c), 0);
  for i:=1 to b[0] do begin
   bignumMultiplyOne(a, b[i], tmp, i-1);
   bignumPlus(c, tmp, c);
  end;
 end;
procedure bignumPrint(a: bignum);
 var i, i2: integer;
 begin
  i2:=0;
  for i:=a[0] downto 1 do begin
   write(a[i]);
   inc(i2);
   if i2 mod 70=0 then writeln();
  end;
 end;
operator **(a: bignum; n: longint) b: bignum; inline;
 var i: longint;
 begin
  b:=a;
  for i:=2 to n do
   bignumMultiply(b, a, b);
 end;
operator *(a, b: bignum) c: bignum; inline;
 begin
  bignumMultiply(a, b, c);
 end;
function bignumExpo(a: bignum; b: longint): bignum;
 begin
  if b<=4 then exit(a**b) else begin
   bignumExpo:=(bignumExpo(a, b div 2))**2;
   if b mod 2<>0 then bignumExpo:=bignumExpo*a;
  end;
 end;
begin
 for i:=0 to 89 do begin
  lutmul1[i]:=i mod 10;
  lutmul2[i]:=i div 10;
 end;
 fillchar(res, sizeof(res), 0);
 res[0]:=1;
 res[1]:=1;
 readln(n, p);
 bignumInit(a, n);
 res:=bignumExpo(a, p);
 bignumPrint(res);
end.
