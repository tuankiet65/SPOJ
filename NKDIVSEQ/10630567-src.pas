var n, d, i, max: qword;
begin
 readln(n);
 d:=1;
 i:=1;
 while d<n do begin
  inc(i);
  inc(d, i);
  max:=(max+(i-(max mod i)))+(i*(i-1));
 end;
 write(max-(i*(d-n)));
end.