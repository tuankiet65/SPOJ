program pbcdiv;
const lookup: array [0..60] of longint=(0,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0);
      lookup2: array [0..60] of longint=(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5);
var t, i: longint;
    a, b, d: qword;
    f: text;
procedure proc;
 var i: qword;
 begin
  i:=a;
  while i<=b do begin
   if ((i mod 12=0) or (i mod 30=0)) and (i mod 60<>0) then inc(d);
   inc(i);
  end;
 end;
procedure proc2;
 var b2, tmp: qword;
 begin
  if a mod 60<>0 then begin
   tmp:=a-(a-(a mod 60));
   d:=d+lookup[tmp];
   a:=a+(60-(a mod 60));
  end;
  if b mod 60<>0 then begin
   tmp:=b-((b div 60)*60);
   d:=d+lookup2[tmp];
   b:=(b div 60)*60;
  end;
 end;
begin
 readln(t);
 for i:=1 to t do begin
  readln(a, b);
  d:=0;
  if b<60 then proc else begin
   proc2;
   d:=d+(5*((b-a+1) div 60));
  end;
  writeln(d);
 end;
end.
