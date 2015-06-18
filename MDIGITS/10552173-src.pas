program mdigits;
uses crt;
var c: array ['0'..'9'] of longint;
    a, b, i, i2, tmp: longint;
    s: string;
    ch: char;
begin
 readln(a, b);
 while (a<>0) and (b<>0) do begin
  fillchar(c, sizeof(c), 0);
  if a>b then begin
   tmp:=a;
   a:=b;
   b:=tmp;
  end;
  for i:=a to b do begin
   str(i, s);
   for i2:=1 to length(s) do
    inc(c[s[i2]]);
  end;
  for ch:='0' to '8' do write(c[ch], ' ');
  writeln(c['9']);
  readln(a, b);
 end;
end.