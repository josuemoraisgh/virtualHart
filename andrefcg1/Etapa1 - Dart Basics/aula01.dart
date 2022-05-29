//global
import 'dart:ffi';

var c = 2;

void main() {
  String d = "ola";
  print(d);
  print(soma(b: c, a: 3));
}

int soma({final int a = 8, final int b = 12}) {
  var c;
  c = b + a;
  return c;
}
