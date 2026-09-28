int divide(int a, int b) {
  if (b == 0) throw UnsupportedError('Cannot divide by zero');
  return a ~/ b;
}

void solution12_2() {
  try {
    print('10 / 2 = ${divide(10, 2)}');
    print('10 / 0 = ${divide(10, 0)}');
  } on UnsupportedError catch (e) {
    print('Caught UnsupportedError: ${e.message}');
  }
}

void greet(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('name must not be null or empty');
  }
  print('Hello, $name!');
}

void solution12_3() {
  for (final input in <String?>['Durdona', '', null]) {
    try {
      greet(input);
    } on ArgumentError catch (e) {
      print('Caught: $e');
    }
  }
}

void risky(int mode) {
  switch (mode) {
    case 1:
      int.parse('abc');
    case 2:
      final list = [1, 2, 3];
      print(list[10]);
    case 3:
      throw Exception('Generic exception');
    default:
      throw StateError('Unexpected mode $mode');
  }
}

void solution12_4() {
  for (int mode = 1; mode <= 4; mode++) {
    try {
      risky(mode);
    } on FormatException catch (e) {
      print('Mode $mode -> FormatException: ${e.message}');
    } on RangeError catch (e) {
      print('Mode $mode -> RangeError: ${e.message}');
    } on Exception catch (e) {
      print('Mode $mode -> Exception: $e');
    } catch (e) {
      print('Mode $mode -> Something else: $e');
    }
  }
}

void main() {
  solution12_2();
  solution12_3();
  solution12_4();
}