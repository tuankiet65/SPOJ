program cruell;
type bignum=array [0..15000] of integer;
var a, res: bignum;
    p, i, n: longint;
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
 const lut1: array [0..19] of integer=(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
       lut2: array [0..19] of integer=(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
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
   c[i+offset]:=(a[i]*b+re) mod 10;
   re:=(a[i]*b+re) div 10;
  end;
  if c[i+offset]<>0 then c[0]:=i+offset else c[0]:=i+offset-1;
 end;
procedure bignumMultiply(a: bignum; b: longint; var c: bignum);
 var tmp: bignum;
     i: longint;
 begin
  i:=1;
  fillchar(c, sizeof(c), 0);
  while b<>0 do begin
   bignumMultiplyOne(a, b mod 10, tmp, i-1);
   bignumPlus(c, tmp, c);
   b:=b div 10;
   inc(i);
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
begin
 fillchar(res, sizeof(res), 0);
 res[0]:=1;
 res[1]:=1;
 readln(n, p);
 bignumInit(a, n);
 for i:=1 to p do
  bignumMultiply(res, n, res);
 bignumPrint(res);
end.