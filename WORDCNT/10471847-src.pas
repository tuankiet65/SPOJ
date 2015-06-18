program wordcnt;
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
  split:=maxd;
 end;
begin
 clrscr;
 readln(n);
 for i:=1 to n do begin
  readln(s);
  write(split(s));
 end;
end.