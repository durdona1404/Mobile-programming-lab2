typedef UserProfile = Map<String, dynamic>;
typedef UserDirectory = Map<String, UserProfile>;

void solution2_2() {
  int age = 20;
  double gpa = 3.8;
  String country = 'Uzbekistan';
  bool isStudent = true;
  print('Age: $age, GPA: $gpa, Country: $country, Student: $isStudent');
}

void solution2_3() {
  final DateTime finalTime = DateTime.now();
  const int constNumber = 42;

  print('final (set at run time): $finalTime');
  print('const (set at compile time): $constNumber');

  const a = [1, 2, 3];
  const b = [1, 2, 3];
  print('Same const object? ${identical(a, b)}');
  final c = [1, 2, 3];
  final d = [1, 2, 3];
  print('Same final object? ${identical(c, d)}');
}

void solution2_4() {
  String nonNullable = 'Always has a value';
  String? nullable;

  print(nonNullable);
  print('Fallback with ??: ${nullable ?? 'Guest'}');

  nullable ??= 'Assigned because it was null';
  print(nullable);

  int? maybeNumber;
  print('Null-aware access: ${maybeNumber?.isEven ?? false}');
}

void describe(Object value) {
  if (value is String) {
    print('String of length ${value.length}');
  } else if (value is int) {
    print('Int, is even? ${value.isEven}');
  } else if (value is List<int>) {
    print('List sum: ${value.fold(0, (a, b) => a + b)}');
  } else {
    print('Unknown type: ${value.runtimeType}');
  }
}

void solution2_5() {
  dynamic anything = 'Dart';
  describe(anything);
  anything = 10;
  describe(anything);
  anything = [1, 2, 3];
  describe(anything);
  anything = 3.5;
  describe(anything);
}

void solution2_6() {
  (double, double, double) point = (1.5, 2.0, -3.25);
  print('x = ${point.$1}, y = ${point.$2}, z = ${point.$3}');

  var named = (x: 1.0, y: 2.0, z: 3.0);
  print('Named: x=${named.x}');
  var (x, y, z) = point;
  print('Destructured: $x, $y, $z');
}

void solution2_7() {
  UserDirectory users = {
    'u1': {
      'name': 'Alice',
      'age': 20,
      'skills': ['Dart', 'Flutter'],
      'address': {'city': 'Tashkent', 'zip': '100000'},
    },
    'u2': {
      'name': 'Bob',
      'age': 22,
      'skills': ['Python'],
      'address': {'city': 'Samarkand', 'zip': '140100'},
    },
  };

  users.forEach((id, UserProfile profile) {
    final address = profile['address'] as Map<String, dynamic>;
    print('$id: ${profile['name']} (${profile['age']}) from ${address['city']}, '
        'skills: ${(profile['skills'] as List).join(', ')}');
  });
}

void main() {
  solution2_2();
  solution2_3();
  solution2_4();
  solution2_5();
  solution2_6();
  solution2_7();
}