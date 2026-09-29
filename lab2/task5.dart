import 'dart:math';

void problem2() {
  double a = 1, b = -5, c = 6;

  // Discriminant of ax^2 + bx + c = 0
  double d = b * b - 4 * a * c;

  /* Quadratic formula:
     x = (-b +/- sqrt(d)) / 2a */
  double x1 = (-b + sqrt(d)) / (2 * a);
  double x2 = (-b - sqrt(d)) / (2 * a);
  print('Roots: $x1 and $x2');
}

/// Utility methods for validating user input.
class Validator {
  Validator._();

  /// Returns `true` if [email] looks like a valid e-mail address.
  ///
  /// Throws an [ArgumentError] if [email] is empty.
  static bool isValidEmail(String email) {
    if (email.isEmpty) throw ArgumentError('Email must not be empty');
    return RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(email);
  }

  /// Returns `true` if [age] is between 0 and 120 (inclusive).
  static bool isValidAge(int age) => age >= 0 && age <= 120;
}

void problem3() {
  print('student@newuu.uz valid? ${Validator.isValidEmail('student@newuu.uz')}');
  print('not-an-email valid? ${Validator.isValidEmail('not-an-email')}');
  print('Age 20 valid? ${Validator.isValidAge(20)}');
  try {
    Validator.isValidEmail('');
  } on ArgumentError catch (e) {
    print('Caught: $e');
  }
}

/// Calculates the **area** of a circle.
///
/// * Returns `0` when [radius] is zero
/// * Throws an [ArgumentError] if [radius] is negative
///
/// ```dart
/// print(circleArea(2)); // 12.566370614359172
/// ```
double circleArea(double radius) {
  if (radius < 0) throw ArgumentError('Radius must not be negative');
  return pi * radius * radius;
}

void problem4() {
  print('Area (radius 2): ${circleArea(2)}');
  print('Area (radius 0): ${circleArea(0)}');
}

/// A basic shape.
class Shape5 {
  /// Returns the area of the shape.
  ///
  /// Subclasses should override this method.
  double area() => 0;

  /// Old way to get the area.
  ///
  /// Use [area] instead.
  @deprecated
  double getArea() => area();
}

/// A square shape.
class Square5 extends Shape5 {
  /// Length of one side.
  final double side;

  /// Creates a square with the given [side].
  Square5(this.side);

  /// Returns the side multiplied by itself.
  @override
  double area() => side * side;
}

void problem5() {
  final square = Square5(3);
  print('Area: ${square.area()}');
  print('Old way: ${square.getArea()}');
}

/// Manages a simple list of to-do items.
///
/// Example:
/// ```dart
/// final list = TodoList();
/// list.add('Study Dart');
/// print(list.count); // 1
/// ```
class TodoList {
  final List<String> _items = [];

  /// The number of items in the list.
  int get count => _items.length;

  /// All items as a list that cannot be changed.
  List<String> get items => List.unmodifiable(_items);

  /// Adds an [item] to the list.
  ///
  /// Throws an [ArgumentError] if [item] is empty.
  void add(String item) {
    if (item.isEmpty) {
      throw ArgumentError('Item cannot be empty');
    }
    _items.add(item);
  }

  /// Removes [item] from the list.
  ///
  /// Returns `true` if it was removed and `false` if it was not found.
  bool remove(String item) => _items.remove(item);
}

void problem6() {
  final list = TodoList();
  list.add('Study Dart');
  list.add('Do the lab');
  print('Items: ${list.items}');
  print('Count: ${list.count}');
  print('Removed? ${list.remove('Do the lab')}');
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
