enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void problem2() {
  for (final day in Day.values) {
    print('${day.index + 1}: ${day.name}');
  }
}

enum Status { loading, success, error, empty }

String statusMessage(Status status) => switch (status) {
      Status.loading => 'Loading, please wait...',
      Status.success => 'Data loaded successfully',
      Status.error => 'Something went wrong',
      Status.empty => 'Nothing to show',
    };

void problem3() {
  for (final status in Status.values) {
    print('${status.name} -> ${statusMessage(status)}');
  }
}

abstract interface class Describable {
  String describe();
}

enum TShirtSize implements Describable {
  small(1, 'S'),
  medium(2, 'M'),
  large(3, 'L');

  final int level;
  final String label;

  const TShirtSize(this.level, this.label);

  double get priceMultiplier => 1 + level * 0.25;

  double priceFor(double basePrice) => basePrice * priceMultiplier;

  @override
  String describe() => 'Size $label (level $level)';
}

void problem4() {
  for (final size in TShirtSize.values) {
    print('${size.describe()} costs \$${size.priceFor(20).toStringAsFixed(2)}');
  }
}

enum Fruit { apple, banana, cherry }

Fruit? parseFruit(String text) {
  try {
    return Fruit.values.byName(text);
  } on ArgumentError {
    return null;
  }
}

void problem5() {
  print(parseFruit('banana'));
  print(parseFruit('mango'));
}

enum Setting<T> {
  volume<int>(50),
  darkMode<bool>(false),
  username<String>('guest');

  final T defaultValue;

  const Setting(this.defaultValue);

  static Setting? find(String name) {
    for (final s in Setting.values) {
      if (s.name == name) {
        return s;
      }
    }
    return null;
  }

  static void printAll() {
    for (final s in Setting.values) {
      print('${s.name} = ${s.defaultValue}');
    }
  }
}

void problem6() {
  Setting.printAll();
  print('Found: ${Setting.find('volume')?.name}');
  print('Found: ${Setting.find('unknown')?.name}');
}

void main() {
  problem2();
  problem3();
  problem4();
  problem5();
  problem6();
}
