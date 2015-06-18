program mmass;
const c2n: array ['2'..'9'] of longint=(1, 2, 3, 4, 5, 6, 7, 8);
var s: string;
    pos, tong: longint;
function try(): longint;
 var tmp: longint;
 begin
  try:=0;
  while (pos-1<>length(s)) do
   case s[pos] of
    'C': begin
          tmp:=12;
          inc(try, 12);
          inc(pos);
         end;
    'H': begin
          tmp:=1;
          inc(try);
          inc(pos);
         end;
    'O': begin
          tmp:=16;
          inc(try, 16);
          inc(pos);
         end;
    '2', '3', '4', '5', '6', '7', '8', '9': begin
                                             inc(try, tmp*c2n[s[pos]]);
                                             inc(pos);
                                            end;
    '(': begin
          inc(pos);
          tmp:=try();
          inc(try, tmp);
         end;
    ')': begin
          inc(pos);
          exit();
         end; 
   end;
 end;
begin
 pos:=1;
 tong:=0;
 readln(s);
 tong:=try();
 writeln(tong);
end.
