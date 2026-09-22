import 'dart:io';

void solution1_2() {
  print('Full name: Durdona Valiqulova');
  print('Student ID: 240417');
  print('Major: Software Engineering');
}

void solution1_3(List<String> arguments) {
  print('Total arguments provided: ${arguments.length}');
}

void solution1_4(List<String> arguments) {
  final numbers = arguments.map(num.tryParse).whereType<num>().toList();
  if (numbers.isEmpty) {
    print('Please provide at least one valid number.');
    return;
  }
  final sum = numbers.reduce((a, b) => a + b);
  print('Average: ${sum / numbers.length}');
}

void solution1_5(List<String> arguments) {
  if (arguments.length != 2) {
    print('Warning: exactly 2 arguments required.');
    print('Usage: dart run lab2_section1_main.dart <arg1> <arg2>');
    return;
  }
  print('Received: ${arguments[0]} and ${arguments[1]}');
}

void solution1_6(List<String> arguments) {
  if (arguments.length != 2) {
    stderr.writeln('Error: expected 2 arguments, got ${arguments.length}.');
    exitCode = 64;
    return;
  }
  print('OK: ${arguments.join(' & ')}');
  exitCode = 0;
}

Map<String, String> parseFlags(List<String> arguments) {
  final flags = <String, String>{};
  for (final arg in arguments) {
    if (!arg.startsWith('--')) continue;
    final body = arg.substring(2);
    final index = body.indexOf('=');
    if (index == -1) {
      flags[body] = 'true';
    } else {
      flags[body.substring(0, index)] = body.substring(index + 1);
    }
  }
  return flags;
}

void solution1_7(List<String> arguments) {
  final flags = parseFlags(arguments);
  final port = int.tryParse(flags['port'] ?? '') ?? 8080;
  print('Parsed flags: $flags');
  print('Port in use: $port');
}

void main(List<String> arguments) {
  solution1_2();
  solution1_3(arguments);
  solution1_4(arguments);
  solution1_5(arguments);
  solution1_7(arguments);
  solution1_6(arguments);
}