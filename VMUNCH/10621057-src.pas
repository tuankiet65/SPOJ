program vmunch;
uses crt;
const x: array [1..4] of integer=(-1,0,1,0);
      y: array [1..4] of integer=(0,1,0,-1);
var r, c, i, i2, fr, fc, min: longint;
    map: array [1..100, 1..100] of char;
    mapb: array [0..100, 0..100] of boolean;
    s: string;
procedure try(f, t, k: longint);
 var i: longint;
 begin
  for i:=1 to 4 do
   if (mapb[f+x[i], t+y[i]]=false) and (map[f+x[i], t+y[i]]<>'*') then begin
    mapb[f+x[i], t+y[i]]:=true;
    if map[f+x[i], t+y[i]]='B' then begin
     if k<min then min:=k;
    end else try(f+x[i], t+y[i], k+1);
    mapb[f+x[i], t+y[i]]:=false;
   end;
 end;
begin
 min:=maxint;
 fillchar(mapb, sizeof(mapb), false);
 readln(r, c);
 for i:=0 to c+1 do begin
  mapb[0][i]:=true;
  mapb[r+1][i]:=true;
 end;
 for i:=1 to r do begin
  mapb[i][0]:=true;
  mapb[i][c+1]:=true;
  readln(s);
  for i2:=1 to c do begin
   map[i][i2]:=s[i2];
   if s[i2]='C' then begin
    fr:=r;
    fc:=c;
   end;
  end;
 end;
 try(fr, fc, 1);
 write(min);
end.