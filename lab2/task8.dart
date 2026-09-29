class Animal {
  final String name;

  Animal(this.name);

  void makeSound() => print('$name makes a sound');
}

class Dog extends Animal {
  Dog(super.name);

  @override
  void makeSound() => print('$name says Woof!');
}

void problem2() {
  Animal generic = Animal('Creature');
  Animal dog = Dog('Rex');
  generic.makeSound();
  dog.makeSound();
}

class Vehicle {
  final String brand;

  Vehicle(this.brand);

  void start() => print('$brand starting...');
}

class ElectricCar extends Vehicle {
  final int batteryCapacity;

  ElectricCar(super.brand, this.batteryCapacity);

  @override
  void start() {
    super.start();
    print('Battery capacity: $batteryCapacity kWh');
  }
}

void problem3() {
  ElectricCar('Tesla', 75).start();
}

class Shape {
  final String name;

  Shape(this.name);

  double area() => 0;
}

class Polygon extends Shape {
  final int sides;

  Polygon(super.name, this.sides);
}

class Triangle extends Polygon {
  final double base;
  final double height;

  Triangle(this.base, this.height) : super('Triangle', 3);

  @override
  double area() => 0.5 * base * height;
}

void problem4() {
  final triangle = Triangle(6, 4);
  print('${triangle.name} has ${triangle.sides} sides');
  print('Area: ${triangle.area()}');
  print('Is Shape? ${triangle is Shape}, is Polygon? ${triangle is Polygon}');
}

abstract class Employee {
  final String name;

  Employee(this.name);

  double salary();

  void printInfo() => print('$name earns ${salary()}');
}

class Manager extends Employee {
  Manager(super.name);

  @override
  double salary() => 5000;
}

class Intern extends Employee {
  Intern(super.name);

  @override
  double salary() => 800;
}

void problem5() {
  Manager('Anna').printInfo();
  Intern('Bek').printInfo();
}

final class Logger {
  void log(String message) => print('LOG: $message');
}

base class BaseVehicle {
  void drive() => print('Driving...');
}

base class BaseCar extends BaseVehicle {}

void problem6() {
  Logger().log('Logger cannot be extended outside this library');
  BaseCar().drive();
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
