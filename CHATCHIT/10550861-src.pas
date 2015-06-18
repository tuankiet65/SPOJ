program chatchit;
uses crt;
type dicrw=array [1..8] of string;
     dicr=array [1..5] of string;
const dicrw1: dicrw=('k', 'ko', 'ng', 'n', 'dc', 'hok', 'ntn', 'kq');
      dicrw2: dicrw=('khong', 'khong', 'nguoi', 'nhieu', 'duoc', 'khong', 'nhu the nao', 'ket qua');
      dicr1: dicr=('j', 'w', 'f', 'dz', 'z');
      dicr2: dicr=('gi', 'qu', 'ph', 'd', 'd');
var s: string;
    tmp, i, d, i2: byte;
begin
 clrscr;
 read(s);
 s:=' '+s+' ';
 for i:=1 to 8 do
  while pos(' '+dicrw1[i]+' ', s)<>0 do begin
   tmp:=pos(dicrw1[i], s);
   delete(s, tmp, length(dicrw1[i]));
   insert(dicrw2[i], s, tmp);
  end;
 for i:=1 to 5 do
  while pos(dicr1[i], s)<>0 do begin
   tmp:=pos(dicr1[i], s);
   delete(s, tmp, length(dicr1[i]));
   insert(dicr2[i], s, tmp);
  end;
 delete(s, 1, 1);
 delete(s, length(s), 1);
 write(s)
end.
