type bignum=array [0..2001] of longint;
var a, b, res: bignum;
    s, s2: widestring;
    i: longint;
    minus: boolean=false;
    t: text;
function max(a, b: longint): longint;
 begin
  if a>b then max:=a else max:=b;
 end;
procedure bignumInit(var a: bignum; s: widestring);
 const c2n: array ['0'..'9'] of longint=(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
 var i, i2: longint;
 begin
  fillchar(a, sizeof(a), 0);
  while (s[1]='0') do begin
   delete(s, 1, 1);
   if s='' then break;
  end;
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
procedure bignumOutput(c: bignum; minus: boolean);
 var i: longint;
 begin
  if minus then write(t, '-');
  minus:=false;
  i:=c[0];
  while c[i]=0 do begin
   dec(i);
   if i=-1 then break;
  end;
  for i:=i downto 1 do begin
    write(t, c[i]);
    minus:=true;
  end;
  if not minus then write(t, 0);
 end;
function bignumCmp(a, b: bignum): boolean;
 var i: longint;
 begin
  for i:=max(a[0], b[0]) downto 1 do
   if a[i]>b[i] then exit(true) else
    if a[i]<b[i] then exit(false);
 end;
procedure bignumMinus(a, b: bignum; var c: bignum);
 var i, re, tmp2: longint;
 begin
  if bignumCmp(b, a) then begin
   c:=a;
   a:=b;
   b:=c;
   minus:=true;
  end;
  fillchar(res, sizeof(res), 0);
  re:=0;
  for i:=1 to max(a[0], b[0])+1 do begin
   tmp2:=a[i];
   if tmp2-b[i]-re<0 then inc(tmp2, 10);
   c[i]:=(tmp2-b[i]-re) mod 10;
   re:=tmp2 div 10;
  end;
  if c[i]<>0 then c[0]:=i else c[0]:=i-1;
 end;
procedure bignumMultiplyOne(a: bignum; b: longint; var c: bignum; offset: longint);
 var i, re: longint;
 begin
  fillchar(c, sizeof(c), 0);
  for i:=1 to a[0]+1 do begin
   c[i+offset]:=(a[i]*b+re) mod 10;
   re:=(a[i]*b+re) div 10;
  end;
  if c[i]<>0 then c[0]:=i+offset else c[0]:=i+offset-1;
 end;
procedure bignumMultiply(a, b: bignum; var c: bignum);
 var tmp: bignum;
     i: longint;
 begin
  if bignumCmp(b, c) then begin
   c:=a;
   a:=b;
   b:=c;
  end;
  fillchar(c, sizeof(c), 0);
  for i:=1 to b[0] do begin
   bignumMultiplyOne(a, b[i], tmp, i-1);
   bignumPlus(c, tmp, c);
  end;
 end;
begin
{$ifndef ONLINE_JUDGE}
 assign(t, 'BIGNUM.INP');
{$else}
 assign(t, '');
{$endif}
 reset(t);
 readln(t, s);
 readln(t, s2);
 close(t);
{$ifndef ONLINE_JUDGE}
 assign(t, 'BIGNUM.OUT');
{$else}
 assign(t, '');
{$endif}
 rewrite(t);
 bignumInit(a, s);
 bignumInit(b, s2);
 bignumPlus(a, b, res);
 bignumOutput(res, false);
 writeln(t);
 bignumMinus(a, b, res);
 bignumOutput(res, minus);
 writeln(t);
 bignumMultiply(a, b, res);
 bignumOutput(res, false);
 close(t);
end.
