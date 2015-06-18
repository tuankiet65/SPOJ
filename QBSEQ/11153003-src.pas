const
  maxN = 1000;
  maxK = 1000;
var
  a: array[1..maxN] of longint;
  Count: array[0..maxK - 1] of longint;
  f, Trace: array[0..maxK - 1, 0..maxK - 1] of longint;
  n, k: longint;

procedure Enter;
var
  i: longint;
begin
  Readln(n, k);
  FillChar(Count, SizeOf(Count), 0);
  for i := 1 to n do
    begin
      Read(a[i]);
      Inc(Count[a[i] mod k]);
    end;
end;

function Sub(x, y: longint): longint;
var
  tmp: longint;
begin
  tmp := (x - y) mod k;
  if tmp >= 0 then Sub := tmp
  else Sub := tmp + k;
end;

procedure Optimize;
var
  i, j, t: longint;
begin
  FillChar(f, SizeOf(f), 0);
  f[0, 0] := Count[0];
  FillChar(Trace, SizeOf(Trace), $FF);
  Trace[0, 0] := Count[0];
  for i := 1 to k - 1 do
    for t := 0 to k - 1 do
      for j := 0 to Count[i] do
        if (Trace[i - 1, Sub(t, j * i)] <> -1) and
           (f[i, t] < f[i - 1, Sub(t, j * i)] + j) then
          begin
            f[i, t] := f[i - 1, Sub(t, j * i)] + j;
            Trace[i, t] := j;
          end;
end;

procedure Result;
var
  i, t, j: longint;
begin
  t := 0;
  for i := k - 1 downto 0 do
    begin
      j := Trace[i, t];
      t := Sub(t, j * i);
      Count[i] := j;
    end;
  Writeln(f[k - 1, 0]);
end;

begin
  Enter;
  Optimize;
  Result;
end.

