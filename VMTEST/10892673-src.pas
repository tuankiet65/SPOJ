program vmtest;
const ch=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
var s: string;
    d, i: byte;
    a, c: array [1..9] of string;
    b: array [1..9] of longint;
procedure std(var s: string);
 var i: longint;
 begin
  i:=1;
  while i<=length(s) do
   if (s[i]=' ') and (s[i+1]=' ') then delete(s, i, 1) else inc(i);
 end;
procedure split(s: string);
 var i: byte;
 begin
  s:=s+' ';
  i:=1;
  while s<>'' do begin
   a[i]:=copy(s, 1, pos(' ', s)-1);
   delete(s, 1, pos(' ', s));
   inc(i);
  end;
 end;
procedure processword;
 var i: longint;
     s: string;
 begin
  s:='';
  for i:=1 to 9 do
   s:=s+a[i];
  for i:=1 to length(s) do
   if not(upcase(s[i]) in ch) then begin
    inc(d);
    c[d]:='Error!';
    exit;
   end;
  inc(d);
  c[d]:=s;
 end;
function check(s: string): string;
 var c: integer;
     tmp: real;
 begin
  val(s, tmp, c);
  if c<>0 then exit('c') else exit('n');
 end;
function convert(s: string): real;
 var c: integer;
 begin
  if s='' then exit(0);
  val(s, convert, c);
 end;
procedure processnum;
 var i: longint;
     x: real;
 begin
  x:=convert(a[1]);
  for i:=2 to 9 do
   if (check(a[i])='c') and (a[i]<>'') then begin
    inc(d);
    c[d]:='Error!';
    exit;
   end else x:=x+convert(a[i]);
  inc(d);
  str(x:0:6, c[d]);
 end;
begin
 while true do begin
  fillchar(a, sizeof(a), 0);
  fillchar(b, sizeof(b), 0);
  readln(s);
  if s='?' then break;
  std(s);
  split(s);
  case check(a[1]) of
   'c': processword;
   'n': processnum;
  end;
 end;
 for i:=1 to d-1 do
  writeln(c[i]);
 write(c[d]);
end.
