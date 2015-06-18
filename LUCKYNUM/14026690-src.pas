program luckynum;
type r=record
      n: string;
      re: longint;
     end;
     queue=record
      ptop, pbottom: longint;
      a: array [1..10000] of r;
     end;
var n, i, x: longint;
    t: text;
procedure q_init(var q: queue);
 begin
  fillchar(q, sizeof(q), 0);
  q.ptop:=0;
  q.pbottom:=0;
 end;
function q_poptop(var q: queue): r;
 begin
  if q.ptop+1>q.pbottom then begin
   q_poptop.n:=#0;
   exit();
  end;
  inc(q.ptop);
  exit(q.a[q.ptop]);
 end;
procedure q_push(var q: queue; dat: r);
 begin
  inc(q.pbottom);
  q.a[q.pbottom]:=dat;
 end;
function r_return(dat: r; c, x: longint): r;
 begin
  r_return:=dat;
  r_return.n:=r_return.n+chr(48+c);
  r_return.re:=(r_return.re*10+c) mod x;
 end;
function process(n: longint): string;
 var a: array [0..10000] of boolean;
     q: queue;
     tmp: r;
 begin
  fillchar(a, sizeof(a), false);
  q_init(q);
  if 6 mod n=0 then
   exit('6')
  else begin
   q_push(q, r_return(tmp, 6, n));
   a[6 mod n]:=true;
  end;
  if 8 mod n=0 then
   exit('8')
  else if not(a[8 mod n]) then begin
   q_push(q, r_return(tmp, 8, n));
   a[8 mod n]:=true;
  end;
  tmp:=q_poptop(q);
  while (tmp.n<>#0) and (length(tmp.n)<200) do begin
   if not(a[(tmp.re*10+6) mod n]) then begin
    q_push(q, r_return(tmp, 6, n));
    a[(tmp.re*10+6) mod n]:=true;
   end;
   if a[0] then exit(q.a[q.pbottom].n);
   if not(a[(tmp.re*10+8) mod n]) and (tmp.n[length(tmp.n)]='8') then begin
    q_push(q, r_return(tmp, 8, n));
    a[(tmp.re*10+8) mod n]:=true;
   end;
   if a[0] then exit(q.a[q.pbottom].n);
   tmp:=q_poptop(q);
  end;
  exit('-1');
 end;
begin
 readln(n);
 for i:=1 to n-1 do begin
  readln(x);
  writeln(process(x));
 end;
 read(x);
 write(process(x)) 
end.
