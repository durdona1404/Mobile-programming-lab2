enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

void solution7_2() {
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

void solution7_3() {
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

void solution7_4() {
  for (final size in TShirtSize.values) {
    print('${size.describe()} costs \$${size.priceFor(20).toStringAsFixed(2)}');
  }
}

void main() {
  solution7_2();
  solution7_3();
  solution7_4();
}