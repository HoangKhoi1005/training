void main() {
  /// Primitive type: String, int, double, float, bool,...
  /// Others type: list, map, set, object,... -> address pointer
  ///
  ///
}

void vars() {
  /// variables can modify
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };
}

void finals() {
  /// - Cannot modify primitive types(int, float,..)
  /// - Can modify others type, because of its address pointer
  final name = 'Voyager I';
  final year = 1977;
  final antennaDiameter = 3.7;

  /// final List<String> flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  final flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  /// final Set<String> setOfObjects = {'Jupiter', 'Saturn', 'Uranus', 'Neptune'};
  final setOfObjects = {'Jupiter', 'Saturn', 'Uranus', 'Neptune'};

  /// final Map<String, dynamic> image = {
  ///   'tags': ['saturn'],
  ///   'url': '//path/to/saturn.jpg',
  /// };
  ///
  /// final Map image = {
  ///   'tags': ['saturn'],
  ///   'url': '//path/to/saturn.jpg',
  /// };
  final image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };

  final maps = <dynamic, dynamic>{};
  final sets = <dynamic>{};
}
