program c11seq3;
const a: array [1..25] of longint=(1,
2,
4,
8,
16,
23,
46,
29,
58,
116,
223,
446,
289,
578,
1156,
1223,
2446,
2489,
4789,
5789,
11578,
12356,
12247,
24449,
48889);
 b: array [0..5] of longint=(
 77789,
155578,
111356,
122227,
244445,
48889);
var n: longint;
    s: string;
begin
 readln(n);
 if (n>=1) and (n<=25) then
  write(a[n])
 else
  write(b[(n-26) mod 6]);
end.
