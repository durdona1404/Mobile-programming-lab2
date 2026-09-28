import 'dart:async';

class User {
  final int id;
  final String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

Future<User> fetchUserFromDb(int id) async {
  await Future.delayed(const Duration(seconds: 2));
  return User(id, 'Student $id');
}

Future<void> solution11_2() async {
  print('Looking up user...');
  final user = await fetchUserFromDb(7);
  print('Found: $user');
}

Future<String> runTask(String name, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return '$name finished after ${seconds}s';
}

Future<void> solution11_3() async {
  final watch = Stopwatch()..start();
  final results = await Future.wait([
    runTask('Task A', 1),
    runTask('Task B', 2),
    runTask('Task C', 3),
  ]);
  for (final result in results) {
    print(result);
  }
  print('Total time: about ${watch.elapsed.inSeconds}s (concurrent, not 6s)');
}

Future<void> solution11_4() async {
  final done = Completer<void>();
  late StreamSubscription<int> subscription;
  int received = 0;

  subscription = Stream.periodic(
    const Duration(milliseconds: 300),
    (tick) => tick + 1,
  ).listen((value) {
    received++;
    print('Tick $value');
    if (received == 5) {
      subscription.cancel();
      done.complete();
    }
  });

  await done.future;
  print('Subscription cancelled after $received emissions');
}

Future<void> main() async {
  await solution11_2();
  await solution11_3();
  await solution11_4();
}