import 'dart:math';

void solution5_2() {
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

void solution5_3() {
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

void solution5_4() {
  print('Area (radius 2): ${circleArea(2)}');
  print('Area (radius 0): ${circleArea(0)}');
}

void main() {
  solution5_2();
  solution5_3();
  solution5_4();
}