program luckynum;
type r=record
      n: string[200];
      re: longint;
     end;
     queue=array [-1..50000] of r;
var n, i, x: longint;
procedure q_init(var q: queue);
 begin
  fillchar(q, sizeof(q), 0);
  q[-1].re:=0;
  q[0].re:=0;
 end;
procedure q_push(var q: queue; s: string; c: longint; n: longint);
 begin
  inc(q[0].re);
  q[q[0].re].n:=s+chr(48+c);
  q[q[0].re].re:=(q[q[0].re].re*10+c) mod n;
 end;
function q_poptop(var q: queue): r;
 begin
  if q[-1].re=q[0].re then begin
   q_poptop.n:=chr(0);
   exit();
  end;
  inc(q[-1].re);
  exit(q[q[-1].re]);
 end;
function process(n: longint): string;
 var q: queue;
     dat: r;
     a: array [0..10000] of boolean;
 begin
  q_init(q);
  fillchar(a, sizeof(a), false);
  if 6 mod n=0 then
   exit('6')
  else begin
   q_push(q, '', 6, n);
   a[6 mod n]:=true;
  end;
  if 8 mod n=0 then
   exit('8')
  else if not(a[8 mod n]) then
   q_push(q, '', 8, n);
  while true do begin
   dat:=q_poptop(q);
   if dat.n=chr(0) then exit('-1');
   if not(a[(dat.re*10+6) mod n]) then begin
    q_push(q, dat.n, 6, n);
    a[(dat.re*10+6) mod n]:=true;
   end;
   if a[0] then exit(q[q[0].re].n);
   if dat.n[length(dat.n)]='8' then
    if not(a[(dat.re*10+8) mod n]) then begin
     q_push(q, dat.n, 8, n);
     a[(dat.re*10+8) mod n]:=true;
    end;
   if a[0] then exit(q[q[0].re].n)
   end;
 end;
begin
 readln(n);
 for i:=1 to n do begin
  readln(x);
  writeln(process(x));
 end;
end.
