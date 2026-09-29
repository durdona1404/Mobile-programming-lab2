import 'dart:math';

abstract class Shape {
  double area();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() => pi * radius * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

void problem2() {
  final List<Shape> shapes = [Circle(2), Rectangle(3, 4), Circle(1)];
  for (final shape in shapes) {
    print('${shape.runtimeType} area: ${shape.area().toStringAsFixed(2)}');
  }
}

void problem3() {
  final items = <Object>['Dart', 42, 3.14, [1, 2, 3]];
  for (final item in items) {
    if (item is String) {
      print('String of length ${item.length}');
    } else if (item is int) {
      print('Int, is even? ${item.isEven}');
    } else if (item is double) {
      print('Double rounded: ${item.round()}');
    } else {
      print('Other type: ${item.runtimeType}');
    }
  }

  Object value = 'hello';
  String text = value as String;
  print('Cast to String worked: ${text.toUpperCase()}');

  try {
    int number = value as int;
    print(number);
  } on TypeError {
    print('Cast failed: value is a ${value.runtimeType}, not an int');
  }
}

class Repository<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);

  List<T> get all => List.unmodifiable(_items);

  T? findWhere(bool Function(T item) test) {
    for (final item in _items) {
      if (test(item)) return item;
    }
    return null;
  }
}

void problem4() {
  final numbers = Repository<int>();
  numbers.add(10);
  numbers.add(25);
  numbers.add(40);
  print('All numbers: ${numbers.all}');
  print('First over 20: ${numbers.findWhere((n) => n > 20)}');
}

sealed class ShapeKind {}

class CircleKind extends ShapeKind {
  final double radius;

  CircleKind(this.radius);
}

class SquareKind extends ShapeKind {
  final double side;

  SquareKind(this.side);
}

class RectangleKind extends ShapeKind {
  final double width;
  final double height;

  RectangleKind(this.width, this.height);
}

double areaOfKind(ShapeKind shape) {
  return switch (shape) {
    CircleKind c => pi * c.radius * c.radius,
    SquareKind s => s.side * s.side,
    RectangleKind r => r.width * r.height,
  };
}

void problem5() {
  print('Circle: ${areaOfKind(CircleKind(2))}');
  print('Square: ${areaOfKind(SquareKind(3))}');
  print('Rectangle: ${areaOfKind(RectangleKind(2, 5))}');
}

abstract class DiscountStrategy {
  double apply(double price);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double price) => price;
}

class TenPercentOff implements DiscountStrategy {
  @override
  double apply(double price) => price * 0.9;
}

class HalfPrice implements DiscountStrategy {
  @override
  double apply(double price) => price * 0.5;
}

class Cart {
  DiscountStrategy strategy;

  Cart(this.strategy);

  double total(double price) => strategy.apply(price);
}

void problem6() {
  var cart = Cart(NoDiscount());
  print('No discount: ${cart.total(100)}');
  cart.strategy = TenPercentOff();
  print('10% off: ${cart.total(100)}');
  cart.strategy = HalfPrice();
  print('Half price: ${cart.total(100)}');
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
