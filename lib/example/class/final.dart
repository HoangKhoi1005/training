void main() {
  /// Final class: không thể kế thừa (extends)
  final finalClass = FinalClass(value: '');
}

final class FinalClass {
  const FinalClass({
    required String value,
  })  : _value = value,
        super();

  const FinalClass.empty() : _value = '';

  factory FinalClass.fromInt(int value) {
    if (value > 0) {
      return FinalClass(value: 'GREATER THAN ZERO');
    }
    return const FinalClass.empty();
  }

  final String _value;
  String get value => _value;
}

/// Internal (file, library) can extend final class
/// External (file, library) could not extend final class
base class InternalClass extends FinalClass {
  InternalClass({required super.value});
}
