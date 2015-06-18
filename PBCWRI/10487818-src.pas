program pbcwri;
uses crt;
var a, b: array [1..52] of longint;
    sn, sm, tmp: ansistring;
    n, m, i, d: longint;
function check: boolean;
 var i: longint;
 begin
  for i:=1 to 52 do
   if a[i]<>b[i] then exit(false);
  check:=true;
 end;
begin
 fillchar(a, sizeof(a), 0);
 fillchar(b, sizeof(b), 0);
 readln(n);
 readln(m);
 sn:='';
 sm:='';
 readln(tmp);
 for i:=1 to n do
  sn:=sn+tmp[i];
 readln(tmp);
 for i:=1 to m do
  sm:=sm+tmp[i];
 d:=0;
 for i:=1 to n do begin
  if sn[i] in ['a'..'z'] then inc(a[ord(sn[i])-71]) else if sn[i] in ['A'..'Z'] then inc(a[ord(sn[i])-64]);
  if sm[i] in ['a'..'z'] then inc(b[ord(sm[i])-71]) else if sm[i] in ['A'..'Z'] then inc(b[ord(sm[i])-64]);
 end;
 if check then inc(d);
 for i:=n+1 to m do begin
  if sm[i] in ['a'..'z'] then inc(b[ord(sm[i])-71]) else if sm[i] in ['A'..'Z'] then inc(b[ord(sm[i])-64]);
  if sm[i-n] in ['a'..'z'] then dec(b[ord(sm[i-n])-71]) else if sm[i-n] in ['A'..'Z'] then dec(b[ord(sm[i-n])-64]);
  if check then inc(d);
 end;
 write(d);
end.
