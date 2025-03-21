void main() {
  final normalClass = PrivatePropertiesClass(value: '');
  print(normalClass.runtimeType);

  final privateClass = PrivatePropertiesClass.fromInt(1);
  print(privateClass.value);

  const constClass = ConstClass(value: '111');
  // final value1 = '111';
  // const cannotBeConstClass = ConstClass(value: value1);
  const value2 = '111';
  const canBeConstClass = ConstClass(value: value2);

  final emptyConstClass = const ConstClass.empty();
  final factoryConstClass = ConstClass.fromInt(2);
}

class PrivatePropertiesClass {
  PrivatePropertiesClass({
    required String value,
  })  : _value = value,
        super();

  PrivatePropertiesClass.empty() : _value = '';

  factory PrivatePropertiesClass.fromInt(int value) {
    if (value > 0) {
      return PrivatePropertiesClass(value: 'GREATER THAN ZERO');
    }
    return PrivatePropertiesClass.empty();
  }

  String _value;
  String get value => _value;
}

class PublicPropertiesClass {
  PublicPropertiesClass({
    required this.value,
  }) : super();

  String value;
}


class ConstClass {
  const ConstClass({
    required String value,
  })  : _value = value,
        super();

  const ConstClass.empty() : _value = '';

  factory ConstClass.fromInt(int value) {
    if (value > 0) {
      return ConstClass(value: 'GREATER THAN ZERO');
    }
    return const ConstClass.empty();
  }

  final String _value;
  String get value => _value;
}