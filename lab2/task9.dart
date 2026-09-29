abstract interface class DBConnector {
  void connect();
  void disconnect();
}

class MySQLConnector implements DBConnector {
  bool _connected = false;

  bool get isConnected => _connected;

  @override
  void connect() {
    _connected = true;
    print('MySQL connected');
  }

  @override
  void disconnect() {
    _connected = false;
    print('MySQL disconnected');
  }
}

void problem2() {
  final DBConnector db = MySQLConnector();
  db.connect();
  db.disconnect();
}

mixin Flyable {
  void fly() => print('$runtimeType is flying');
}

class Bird with Flyable {}

void problem3() {
  Bird().fly();
}

mixin Walker {
  void walk() => print('$runtimeType is walking');
}

mixin Swimmer {
  void swim() => print('$runtimeType is swimming');
}

class Duck with Walker, Swimmer, Flyable {}

void problem4() {
  final duck = Duck();
  duck.walk();
  duck.swim();
  duck.fly();
}

class Animal {
  void breathe() => print('breathing');
}

mixin AquaticMixin on Animal {
  void swimInWater() {
    breathe();
    print('swimming');
  }
}

class Fish extends Animal with AquaticMixin {}

void problem5() {
  Fish().swimInWater();
}

abstract class Startable {
  void start();
}

class Car implements Startable {
  @override
  void start() => print('Car: I wrote my own start');
}

mixin StartLogic {
  void start() => print('$runtimeType: using start from the mixin');
}

class Bike with StartLogic {}

class Scooter with StartLogic {}

void problem6() {
  Car().start();
  Bike().start();
  Scooter().start();
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
