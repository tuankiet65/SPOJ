program nklineup;
var a: array [1..50000] of longint;
    q, i ,n, c, d: longint;
    tree: array [false..true, 1..99999] of longint;
function cmp(a, b: longint; mode: boolean): longint;
 begin
  case mode of
   false: if a>b then cmp:=b else cmp:=a;
   true: if a>b then cmp:=a else cmp:=b;
  end;
 end;
procedure init(i, l, r: longint; mode: boolean);
 begin
  if l=r then begin
   tree[mode][i]:=a[r];
   exit;
  end;
  init(i*2, l, (l+r) div 2, mode);
  init(i*2+1, (l+r) div 2+1, r, mode);
  tree[mode][i]:=cmp(tree[mode][i*2], tree[mode][i*2+1], mode);
 end;
function get(i, u, v, l, r: longint; mode: boolean): longint;
 begin
  get:=cmp(maxlongint, -maxlongint, not mode);
  if (v<l) or (u>r) then exit;
  if (u<=l) and (v>=r) then
   exit(tree[mode][i]);
  get:=cmp(get(i*2, u, v, l, (l+r) div 2, mode),
           get(i*2+1, u, v, (l+r) div 2+1, r, mode),
           mode);
 end;
begin
 fillchar(tree, sizeof(tree), 0);
 readln(n, q);
 for i:=1 to n do readln(a[i]);
 init(1, 1, n, false);
 init(1, 1, n, true);
 for i:=1 to q do begin
  readln(c, d);
  writeln(get(1, c, d, 1, n, true)-get(1, c, d, 1, n, false));
 end;
end.
