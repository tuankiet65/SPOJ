program vmtest;
uses math;
const ch=['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
var s, res: string;
    i, numa: byte;
    a: array [1..50] of string;
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
  i:=0;
  while s<>'' do begin
   inc(i);
   a[i]:=copy(s, 1, pos(' ', s)-1);
   delete(s, 1, pos(' ', s));
  end;
  numa:=i;
 end;
procedure processword;
 var i: longint;
     s: string;
 begin
  while s[length(s)]=' ' do delete(s, length(s), 1);
  s:='';
  for i:=1 to numa do
   s:=s+a[i];
  for i:=1 to length(s) do
   if not(upcase(s[i]) in ch) then begin
    res:='Error!';
    exit;
   end;
  res:=s;
 end;
function check(s: string): string;
 var c: integer;
     tmp: extended;
 begin
  val(s, tmp, c);
  if c<>0 then exit('c') else exit('n');
 end;
function convert(s: string): extended;
 var c: integer;
 begin
  if s='' then exit(0);
  val(s, convert, c);
 end;
procedure processnum;
 var i: longint;
     x: extended;
 begin
  x:=convert(a[1]);
  for i:=2 to numa do
   if (check(a[i])='c') then begin
    res:='Error!';
    exit;
   end else x:=x+convert(a[i]);
  str(simpleroundto(x, -6):1:6, res);
 end;
begin
 while true do begin
  fillchar(a, sizeof(a), 0);
  readln(s);
  if s='?' then break;
  std(s);
  split(s);
  case check(a[1]) of
   'c': processword;
   'n': processnum;
  end;
  writeln(res);
 end;
end.
