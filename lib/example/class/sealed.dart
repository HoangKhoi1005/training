import 'package:flutter/material.dart';

void main() {
  final Animal cat = Cat(name: 'Tom');
  final Animal elephant = Cat(name: 'Alice');
  final Animal duck = Duck(name: 'Joe');

  final animal = cat;
  switch (animal) {
    case Elephant():
    // TODO: Handle this case.
    case Cat():
    // TODO: Handle this case.
    case Duck():
    // TODO: Handle this case.
  }

  final color = switch (animal) {
    Elephant() => Colors.brown,
    Cat() => Colors.black,
    Duck() => Colors.yellow,
  };
  print('Color $color');

  for (final animal in [cat, duck, elephant]) {
    final color = switch (animal) {
      Elephant() => Colors.brown,
      Cat() => Colors.black,
      Duck() => Colors.yellow,
    };
    print('Color $color');
  }
}

sealed class Animal {
  const Animal({
    required this.name,
    required this.legs,
  });

  final String name;

  final int legs;

  String sound();
}

final class Elephant extends Animal {
  const Elephant({
    required super.name,
  }) : super(legs: 4);

  @override
  String sound() {
    return 'Elephant!!!!';
  }
}

final class Cat extends Animal {
  const Cat({
    required super.name,
  }) : super(legs: 4);

  @override
  String sound() {
    return 'Cat!!!!';
  }
}

final class Duck extends Animal {
  const Duck({
    required super.name,
  }) : super(legs: 2);

  @override
  String sound() {
    return 'Duck!!!!';
  }
}
