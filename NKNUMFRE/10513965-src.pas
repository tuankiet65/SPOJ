program nknumfre;
uses crt;
var l, r, tmp, d, i: longint;
    b: array [1..30000] of boolean;
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
 for i:=l to r do begin
  tmp:=rev(i);
  if i=tmp then begin
   b[i]:=true;
   inc(d);
  end;
  if (tmp<=r) and (tmp>=l) and not(b[tmp]) then begin
   b[tmp]:=true;
   b[i]:=true;
   inc(d, 2);
  end;
 end;
 write(d);
end.