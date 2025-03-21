void main() {
  final fruits = Fruits.values;
  fruits.forEach(print);

  for (final value in Animals.values) {
    print(value);
  }
}

/// Cách khai báo ENUM cơ bản
enum Fruits {
  mango,
  kiwi,
  apple,
}

/// Cách khai báo ENUM nâng cao
enum Animals {
  elephant(name: 'Elephant', legs: 4),
  duck(name: 'Duck', legs: 2),
  chicken(name: 'Chicken', legs: 2),
  ;

  const Animals({
    required this.name,
    required this.legs,
  });

  final String name;

  final int legs;
}
