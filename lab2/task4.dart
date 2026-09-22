bool isEven(int n) => n % 2 == 0;

String decorate(String text, [String prefix = '', String suffix = '']) =>
    '$prefix$text$suffix';

List<int> transformAll(List<int> numbers, int Function(int) transformer) =>
    numbers.map(transformer).toList();

int fibonacci(int n) {
  if (n < 0) throw ArgumentError('n must be >= 0');
  if (n < 2) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

final Map<int, int> _memo = {};
int fibonacciMemo(int n) {
  if (n < 2) return n;
  return _memo[n] ??= fibonacciMemo(n - 1) + fibonacciMemo(n - 2);
}

int Function() makeCounter() {
  int count = 0;
  return () => ++count;
}

T maxOf<T extends Comparable<T>>(T a, T b) => a.compareTo(b) >= 0 ? a : b;

T maxInList<T extends Comparable<T>>(List<T> items) {
  if (items.isEmpty) throw ArgumentError('List must not be empty');
  T best = items.first;
  for (final item in items.skip(1)) {
    best = maxOf(best, item);
  }
  return best;
}

void main() {
  print('isEven(10): ${isEven(10)}, isEven(7): ${isEven(7)}');

  print(decorate('World'));
  print(decorate('World', 'Hello, '));
  print(decorate('World', 'Hello, ', '!'));

  final nums = [1, 2, 3, 4, 5];
  print('Squared: ${transformAll(nums, (x) => x * x)}');
  print('Doubled: ${transformAll(nums, (x) => x * 2)}');

  print('fib(10) = ${fibonacci(10)}');
  print('fibMemo(50) = ${fibonacciMemo(50)}');

  final counterA = makeCounter();
  final counterB = makeCounter();
  print('A: ${counterA()}, ${counterA()}, ${counterA()}');
  print('B: ${counterB()}');

  print(maxOf<String>('apple', 'banana'));
  print(maxOf<num>(3, 7.5));
  print(maxOf(DateTime(2024, 1, 1), DateTime(2025, 6, 1)));
  print(maxInList<String>(['kiwi', 'pear', 'zebra', 'mango']));
}
