lnprogram wordcnt;
uses crt;
var n, i: byte;
    s: ansistring;
function split(s: ansistring): longint;
 var i, tmp, l, d, maxd: longint;
 begin
  i:=0;
  s:=s+' ';
  l:=0;
  d:=0;
  maxd:=0;
  while s<>'' do begin
   inc(i);
   tmp:=length(copy(s, 1, pos(' ', s)-1));
   delete(s, 1, pos(' ', s));
   if tmp=l then inc(d) else begin
    l:=tmp;
    if maxd<d then maxd:=d;
    d:=1;
   end;
  end;
  if maxd<d then maxd:=d;
  split:=maxd;
 end;
function std(s: ansistring): ansistring;
 var i: longint;
 begin
  std:=s;
  while std[1]=' ' do delete(std, 1, 1);
  while std[length(std)]=' ' do delete(std, length(std), 1);
  i:=1;
  while i<length(std) do
   if (std[i]=' ') and (std[i+1]=' ') then delete(std, i, 1) else inc(i);
 end;
begin
 clrscr;
 readln(n);
 for i:=1 to n do begin
  readln(s);
  writeln(split(std(s)));
 end;
end.
