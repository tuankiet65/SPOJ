var i,j,k,n,t:longint;
begin
     Readln(t);
     for j:=1 to t do
     begin
          readln(n);
          for i:=1 to (n-1) div 9 do write('123456790');
          k:=(n-1) mod 9;
          for i:=1 to k do write(i);
          for i:=k+1 downto 2 do write(i);
          for i:=1 to (n-1) div 9 do write('098765432');
          writeln(1);
     end;
end.
