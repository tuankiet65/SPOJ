program qbheap;
var t: text;
    a: array [0..15000] of int64;
    issort: boolean;
    s: string;
    num: longint;
procedure procp;
 var c: longint;
 begin
  if num>15000 then exit;
  inc(num);
  val(copy(s, 2, length(s)), a[num], c);
  issort:=false;
 end;
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
procedure procm;
 var tmp: int64;
 begin
  if num=0 then exit;
  if not(issort) then begin
   if num>1 then sort(1, num);
   issort:=true;
  end;
  tmp:=a[num];
  while (a[num]=tmp) and (num<>0) do begin
   a[num]:=0;
   dec(num);
  end;
 end;
begin
 assign(t, '');
 reset(t);
 issort:=false;
 num:=0;
 a[0]:=0;
 fillchar(a, sizeof(a), 0);
 while not eof(t) do begin
  readln(t, s);
  case s[1] of
   '+': procp;
   '-': procm;
  end;
 end;
 sort(1, num);
 close(t);
end.

