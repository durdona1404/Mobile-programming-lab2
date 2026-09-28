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

void solution9_2() {
  final DBConnector db = MySQLConnector();
  db.connect();
  db.disconnect();
}

mixin Flyable {
  void fly() => print('$runtimeType is flying');
}

class Bird with Flyable {}

void solution9_3() {
  Bird().fly();
}

mixin Walker {
  void walk() => print('$runtimeType is walking');
}

mixin Swimmer {
  void swim() => print('$runtimeType is swimming');
}

class Duck with Walker, Swimmer, Flyable {}

void solution9_4() {
  final duck = Duck();
  duck.walk();
  duck.swim();
  duck.fly();
}

void main() {
  solution9_2();
  solution9_3();
  solution9_4();
}