program nknumfre;
uses crt;
var l, r, tmp, d, i: longint;
    b: array [1..30000] of boolean;
function ucln(x, y: longint): longint;
 var z: longint;
 begin
  while y<>0 do begin
   z:=x mod y;
   x:=y;
   y:=z;
  end;
  ucln:=x;
 end;
function rev(n: longint): longint;
 var s: string;
     c: char;
     i, t, co: longint;
 begin
  str(n, s);
  t:=length(s);
  for i:=1 to length(s) div 2 do begin
   c:=s[i];
   s[i]:=s[t];
   s[t]:=c;
   dec(t);
  end;
  val(s, rev, co);
 end;
begin
 fillchar(b, sizeof(b), false);
 readln(l, r);
 d:=0;
 for i:=l to r do begin
  tmp:=rev(i);
  if (ucln(i, tmp)=1) and not(b[i]) then begin
   inc(d);
   b[i]:=true;
   if (tmp<=r) and not(b[tmp]) then begin
    inc(d); 
    b[tmp]:=true;
   end;
  end;
 end;
 write(d);
end.
