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

void main() {
  final person = Person('Durdona', 20);
  person.introduce();

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

  final first = AppConfig();
  final second = AppConfig();
  first.appName = 'Changed once';
  print('Same instance? ${identical(first, second)}');
  print('Second sees: ${second.appName}');
}