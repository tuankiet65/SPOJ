program vmsort;
var a: array [1..1000] of string;
    i, ca, k, n, i2: longint;
    s: string;
function find(s: string): boolean;
 var i: longint;
 begin
  for i:=1 to ca do
   if s=a[i] then exit(false);
  find:=true;
 end;
begin
 ca:=0;
 readln(k);
 for i:=1 to k do begin
  readln(n);
  for i2:=1 to n do begin
   readln(s);
   if find(s) then begin
    inc(ca);
    a[ca]:=s;
   end;
  end;
 end;
 write(ca);
end.
