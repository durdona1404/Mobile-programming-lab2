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

Future<void> problem2() async {
  print('Looking up user...');
  final user = await fetchUserFromDb(7);
  print('Found: $user');
}

Future<String> runTask(String name, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return '$name finished after ${seconds}s';
}

Future<void> problem3() async {
  final results = await Future.wait([
    runTask('Task A', 1),
    runTask('Task B', 1),
    runTask('Task C', 1),
  ]);
  for (final result in results) {
    print(result);
  }
}

Future<void> problem4() async {
  final done = Completer<void>();
  late StreamSubscription<int> subscription;
  int received = 0;

  subscription = Stream.periodic(
    const Duration(milliseconds: 200),
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

Stream<int> numbers() async* {
  for (var n in [1, 2, 2, 3, 4, 4, 5, 6]) {
    await Future.delayed(const Duration(milliseconds: 50));
    yield n;
  }
}

Future<void> problem5() async {
  var result = numbers().where((n) => n.isEven).map((n) => n * 10).distinct();

  await for (var value in result) {
    print('Value: $value');
  }
}

Future<void> problem6() async {
  var controller = StreamController<int>();

  controller.add(1);
  controller.add(2);
  controller.addError('Something broke');
  controller.add(4);
  controller.close();

  var safeStream = controller.stream.handleError((error) {
    print('Handled error: $error');
  });

  await for (var value in safeStream) {
    print('Value: $value');
  }
}

Future<void> main() async {
  await problem2();
  await problem3();
  await problem4();
  await problem5();
  await problem6();
}
