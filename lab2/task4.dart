import 'dart:math';

void solution3_2(int n) {
  if (n > 0) {
    print('$n is positive');
  } else if (n < 0) {
    print('$n is negative');
  } else {
    print('$n is zero');
  }
}

int factorialFor(int n) {
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

int factorialForIn(int n) {
  int result = 1;
  for (final i in List.generate(n, (index) => index + 1)) {
    result *= i;
  }
  return result;
}

void solution3_3() {
  print('5! (for)    = ${factorialFor(5)}');
  print('5! (for-in) = ${factorialForIn(5)}');
}

void solution3_4() {
  final target = Random().nextInt(100) + 1;
  int low = 1, high = 100, attempts = 0;
  print('Secret number is hidden (1-100). Guessing...');

  while (true) {
    final guess = (low + high) ~/ 2;
    attempts++;
    if (guess == target) {
      print('Guess #$attempts: $guess -> correct!');
      break;
    } else if (guess < target) {
      print('Guess #$attempts: $guess -> too low');
      low = guess + 1;
    } else {
      print('Guess #$attempts: $guess -> too high');
      high = guess - 1;
    }
  }
}

void solution3_5() {
  outer:
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= 5; j++) {
      if (j == 2) continue outer;
      if (i * j == 6) break outer;
      print('i=$i, j=$j');
    }
  }
  print('Finished nested loops');
}

class Point {
  final int x, y;
  Point(this.x, this.y);
}

void describeJson(Object? json) {
  switch (json) {
    case {'type': 'user', 'name': String name, 'age': int age} when age >= 18:
      print('Adult user $name ($age)');
    case {'type': 'user', 'name': String name}:
      print('User $name (age unknown or minor)');
    case {'type': 'point', 'x': num x, 'y': num y}:
      print('Point at ($x, $y)');
    case {'items': List items}:
      print('Collection with ${items.length} items');
    case Point(x: 0, y: 0):
      print('Object pattern: origin');
    case Point(x: var px, y: var py):
      print('Object pattern: Point($px, $py)');
    default:
      print('Unrecognized: $json');
  }
}

void solution3_6() {
  describeJson({'type': 'user', 'name': 'Alice', 'age': 21});
  describeJson({'type': 'user', 'name': 'Tim', 'age': 15});
  describeJson({'type': 'point', 'x': 3, 'y': 4.5});
  describeJson({'items': [1, 2, 3]});
  describeJson(Point(0, 0));
  describeJson(Point(2, 7));
  describeJson({'foo': 'bar'});
}

enum AppState { created, running, paused, stopped, destroyed }

enum AppEvent { start, pause, resume, stop, destroy }

final Map<AppState, Map<AppEvent, AppState>> transitions = {
  AppState.created: {AppEvent.start: AppState.running},
  AppState.running: {AppEvent.pause: AppState.paused, AppEvent.stop: AppState.stopped},
  AppState.paused: {AppEvent.resume: AppState.running, AppEvent.stop: AppState.stopped},
  AppState.stopped: {AppEvent.start: AppState.running, AppEvent.destroy: AppState.destroyed},
};

Iterable<AppState> runLifecycle(List<AppEvent> events) sync* {
  var state = AppState.created;
  yield state;
  for (final event in events) {
    final next = transitions[state]?[event];
    if (next == null) {
      print('  (ignored invalid event $event in state $state)');
      continue;
    }
    state = next;
    yield state;
    if (state == AppState.destroyed) return;
  }
}

void solution3_7() {
  final events = [
    AppEvent.start,
    AppEvent.pause,
    AppEvent.destroy,
    AppEvent.resume,
    AppEvent.stop,
    AppEvent.destroy,
    AppEvent.start,
  ];
  for (final state in runLifecycle(events)) {
    print('State -> ${state.name}');
  }
}

void main() {
  solution3_2(7);
  solution3_2(-3);
  solution3_2(0);
  solution3_3();
  solution3_4();
  solution3_5();
  solution3_6();
  solution3_7();
}