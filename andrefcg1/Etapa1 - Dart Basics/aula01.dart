//global

var c = 2;

void main() {
  somaClass a = somaClass(a: 10, b: 10);
  print(a.value());
}

int soma({required var a, required var b, var c, var d, var e}) {
  var c;
  c = b + a;
  return c;
}

class somaClass {
  late int a;
  int b;
  somaClass({required this.b, required this.a});
  int value() {
    return a + b;
  }
}
