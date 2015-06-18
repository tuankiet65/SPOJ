program qbheap;
var t: text;
    a: array [0..15000] of int64;
    issort: boolean;
    s: string;
    i: longint;
procedure sort(l,r: longint);
 var i, j: longint;
     x, y: int64;
 begin
  i:=l;
  j:=r;
  x:=a[(l+r) div 2];
  repeat
   while a[i]<x do inc(i);
   while x<a[j] do dec(j);
   if not(i>j) then begin
     y:=a[i];
     a[i]:=a[j];
     a[j]:=y;
     inc(i);
     j:=j-1;
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
 end;
procedure procp(s: string);
 var c: longint;
 begin
  if a[0]=15000 then exit();
  inc(a[0]);
  val(s, a[a[0]], c);
  issort:=false;
 end;
procedure procm();
 var tmp: int64;
 begin
  if not(issort) then
   sort(1, a[0]);
  tmp:=a[a[0]];
  while a[a[0]]=tmp do begin
   a[a[0]]:=0;
   dec(a[0]);
  end;
 end;
procedure print();
 var i, d: longint;
     b: array [1..15000] of boolean;
     tmp: int64;
 begin
  fillchar(b, sizeof(b), true);
  tmp:=a[a[0]];
  d:=1;
  for i:=a[0]-1 downto 1 do
   if a[i]=tmp then
    b[i]:=false
   else begin
    inc(d);
    tmp:=a[i];
   end;
  writeln(d);
  for i:=a[0] downto 1 do
   if b[i] then
    writeln(a[i]);
 end;
begin
 assign(t, '');
 reset(t);
 issort:=false;
 a[0]:=0;
 fillchar(a, sizeof(a), 0);
 while not eof(t) do begin
  readln(t, s);
  case s[1] of
   '+': procp(copy(s, 2, length(s)));
   '-': procm;
  end;
 end;
 close(t);
 if not(issort) then
  sort(1, a[0]);
 print();
end.

