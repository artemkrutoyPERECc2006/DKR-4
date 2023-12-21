uses graphABC;

function funkciya(x:real):real;
begin
funkciya:= 2*power(x,3)+(2)*sqr(x)+(5)*x+(9);
end;

function Sp(a, b:real;n:integer):real;
var
  h, x, sum: Real;
  i: Integer;
begin
  h := (b - a) / n;
  for i := 1 to n do
    begin
    x := a + i*h;
    sum += funkciya(x)*h
    end;
Sp :=sum; 
end;

var x1:=0;
var y1:=0;
var x2:=0.0;
begin
write('Введите нижний предел: ');
var a:=ReadReal();
writeln('');
write('Введите верхний предел: ');
var b:=ReadReal();
writeln('');
write('Введите количество подотрезков : ');
var n:=ReadInteger();
writeln('');

var sum := Sp(a, b, n);

var x0 := 250;
var y0 := 250;
SetWindowSize(505, 505);
SetPenColor(clBlack);
SetPenWidth(3);
MoveTo(x0, y0);
Line(-800, y0, 800, y0);
Line(x0, 600, x0, -600);

var l := -10.0;
var p := 10;
var mx := 50;
var my := 5;

var x := l;
var y:=0.0;

while x <= p do
begin
y := funkciya(x);
x1 := x0 + round(x * mx);
y1 := y0 - round(y * my);
setpixel(x1, y1, clred);
x += 0.0001;
end;

x := a;
y := funkciya(x);
x1 := x0 + round(x * mx);
y1 := y0 - round(y * my);
MoveTo(x1, y1);

var h:=(b-a)/n;

while x <= b do
begin
  y := funkciya(x);

  x1 := x0 + round(x * mx);
  y1 := y0 - round(y * my);
  x2 := x0 + round((h + x) * mx);
  setpencolor(clblue);
  lineto(x1, y1);
  
  // Рисование параболы
  MoveTo(x1, y1);
 LineTo(round(x2), y1);
  LineTo(round(x2), y0);
  LineTo(round(x1), y0);
  LineTo(round (x1), y1);
  
  x += h;
end;

writeln('');
writeln('Значение интеграла по методу средних прямоугольников: ', sum);
end.