program mrecaman;
var a: array [0..500000] of longint;
    i, max, min: longint;
    b: array [-373316..3012500] of boolean;
begin
 fillchar(a, sizeof(a), 0);
 fillchar(b, sizeof(b), true);
 fillchar(b, 373316, false);
 max:=0;
 min:=maxlongint;
 for i:=1 to 500000 do begin
  if b[a[i-1]-i] and (a[i-1]>i) then begin
   a[i]:=a[i-1]-i;
   b[a[i]]:=false;
  end else begin
   a[i]:=a[i-1]+i;
   b[a[i]]:=false;
  end;
 end;
end.
