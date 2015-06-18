Var	fi, fo: TEXT;
	a, b, x, y: ANSISTRING;
Function Sum(x, y: ANSISTRING):ANSISTRING;
Var	nho, i, c: INTEGER;
Begin
	Sum:='';
	While Length(x)<Length(y) Do x:='0'+x;
	While Length(y)<Length(x) Do y:='0'+y;
	nho:=0;
	For i:=Length(x) DownTo 1 Do
	Begin
		c:=Ord(x[i]) + Ord(y[i]) - 48 - 48 + nho;
		nho:=c Div 10;
		c:=c Mod 10;
		Sum:=Chr(c + 48) + Sum;
	End;
	If nho<>0 Then Sum:='1' + Sum;
	While (sum[1]='0') and (sum<>'') Do Delete(Sum, 1, 1);
End;
Function Sub(x, y: ANSISTRING):ANSISTRING;
Var	i, c, nho: INTEGER;
Begin
	While Length(x)<Length(y) Do x:='0'+x;
	While Length(y)<Length(x) Do y:='0'+y;
	nho:=0;
	Sub:='';
	For i:=Length(x) DownTo 1 Do
	Begin
		c:=Ord(x[i])-Ord(y[i])-nho;
		If c<0 Then
		Begin
			c:=c+10;
			nho:=1;
		End Else nho:=0;
		Sub:=Chr(c+48)+Sub;
	End;
	While (Sub[1]='0') and (sub<>'') Do Delete(Sub, 1, 1);
End;
function multiply1(a:ANSISTRING;b:longint):ANSISTRING;
var i:INTEGER;
	carry,s:LONGINT;
	c,tmp:ANSISTRING;
Begin
	c:='';
	carry:=0;
	For i:=Length(a) DownTo 1 Do
	Begin
		s:=(ord(a[i])-48) * b + carry;
		carry:= s Div 10;
		c:=chr(s Mod 10 + 48)+c;
	End;
	If carry>0 Then Str(carry,tmp) Else tmp:='';
	multiply1:=tmp+c;
End;
Function Mul(x, y: ANSISTRING):ANSISTRING;
Var	s, tmp: ANSISTRING;
	i, m, j: INTEGER;
Begin
	//If Length(x)<Length(y) Then Swap(x, y);
	m:=-1;s:='';
	For i:=Length(x) DownTo 1 Do
	Begin
		m:=m+1;
		tmp:=multiply1(y,ord(x[i])-48);
		For j:=1 To m Do tmp:=tmp+'0';
		s:=Sum(tmp,s);
	End;
	Mul:=s;
End;
Begin
	Assign(fi, ''); Reset(fi);
	Assign(fo, ''); Rewrite(fo);
	Readln(fi, a);
	Readln(fi, b);
	x:=a; y:=b;
	While Length(x)<Length(y) Do x:='0'+x;
	While Length(y)<Length(x) Do y:='0'+y;
	Writeln(fo, Sum(a, b));
	If (x=y) Then Writeln(fo, '0') Else
	If (x>y) Then Writeln(fo, Sub(a, b)) Else
	Writeln(fo, '-', sub(b, a));
	Writeln(fo, Mul(a, b));
	Close(fo);
End.