void main() {
  // fn1();
  // fn2(1, 2);
  // fn3();
  // fn3(1);
  // fn3(1, 2);
  // fn4(c: 1, d: null);
  // fn4(c: 1, d: 2);
  // fn4(d: 2, c: 1);
  // fn4(c: 1, d: 2, b: 2);
  // fn4(c: 1, d: 2, b: null);
  // fn4(c: 1, d: 2, b: null, a: 10);

  fn5(10);
  fn5(10, 20);
  fn5(10, 20, 30);
  fn5(10, 20, null);

}

void fn1() {
  /// Void function
}

void fn2(num a, num b) {
  /// non-name parameters
}

void fn3([num a = 1, num? b]) {
  /// Optional positional parameters
}

void fn4({
  num a = 1,
  num? b,
  required num c,
  required num? d,
}) {
  /// Named parameters
}

void fn5(num a, [num b = 1, num? c = 2]){
  print('a: $a, b: $b, c: $c');
}
