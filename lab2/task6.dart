class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() => print('Hi, I am $name and I am $age years old.');
}

class Student {
  final String name;
  final int age;

  Student(String name, int age)
      : name = _checkName(name),
        age = _checkAge(age);

  static String _checkName(String value) {
    if (value.trim().isEmpty) throw ArgumentError('Name cannot be empty');
    return value;
  }

  static int _checkAge(int value) {
    if (value < 0 || value > 120) {
      throw RangeError.range(value, 0, 120, 'age');
    }
    return value;
  }

  @override
  String toString() => 'Student($name, $age)';
}

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  String appName = 'Mobile Programming Lab';
}

void problem2() {
  final person = Person('Durdona', 20);
  person.introduce();
}

void problem3() {
  print(Student('Alice', 19));
  try {
    Student('', 19);
  } on ArgumentError catch (e) {
    print('Caught: $e');
  }
  try {
    Student('Bob', 200);
  } on RangeError catch (e) {
    print('Caught: $e');
  }
}

void problem4() {
  final first = AppConfig();
  final second = AppConfig();
  first.appName = 'Changed once';
  print('Same instance? ${identical(first, second)}');
  print('Second sees: ${second.appName}');
}

class Temperature {
  double _celsius = 0;

  double get celsius => _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      throw ArgumentError('Temperature cannot be below absolute zero');
    }
    _celsius = value;
  }

  double get fahrenheit => _celsius * 9 / 5 + 32;
}

void problem5() {
  var temp = Temperature();
  temp.celsius = 25;
  print('Celsius: ${temp.celsius}, Fahrenheit: ${temp.fahrenheit}');
  try {
    temp.celsius = -500;
  } on ArgumentError catch (e) {
    print('Caught: $e');
  }
}

class UserDto {
  final String name;
  final int age;
  final String city;

  const UserDto(this.name, this.age, this.city);
}

void problem6() {
  const a = UserDto('Alice', 20, 'Tashkent');
  const b = UserDto('Alice', 20, 'Tashkent');
  print('${a.name}, ${a.age}, ${a.city}');
  print('Same object? ${identical(a, b)}');
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
