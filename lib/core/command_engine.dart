import 'dart:io';

import 'model/command.dart';

class CommandEngine {
  void execute(Command command) async {
    print('Executing command: $command');
    await executeCommand(command.executable(), command.arguments());
  }

  Future<void> executeCommand(String command, [List<String> arguments = const []]) async {
    print('Executing command: $command ${arguments.join(' ')}');
    ProcessResult results = await Process.run(command, arguments);
    print(results.stdout);
  }
}
