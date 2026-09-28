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

void solution10_2() {
  final List<Shape> shapes = [Circle(2), Rectangle(3, 4), Circle(1)];
  for (final shape in shapes) {
    print('${shape.runtimeType} area: ${shape.area().toStringAsFixed(2)}');
  }
}

void solution10_3() {
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

void solution10_4() {
  final numbers = Repository<int>();
  numbers.add(10);
  numbers.add(25);
  numbers.add(40);
  print('All numbers: ${numbers.all}');
  print('First over 20: ${numbers.findWhere((n) => n > 20)}');

  final names = Repository<String>();
  names.add('Alice');
  names.add('Bob');
  print('Name starting with B: ${names.findWhere((n) => n.startsWith('B'))}');
  print('Name starting with Z: ${names.findWhere((n) => n.startsWith('Z'))}');
}

void main() {
  solution10_2();
  solution10_3();
  solution10_4();
}