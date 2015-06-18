program nkdivseq;
var n, d, i, max: longint;
begin
 readln(n);
 d:=1;
 i:=1;
 max:=1;
 while d<n do begin
  inc(i);
  d:=d+i;
  max:=max+(i-(max mod i));
  max:=max+(i*(i-1));
 end;
 if d=n then write(max) else
  write(max-(i*(d-n-1)));
end.