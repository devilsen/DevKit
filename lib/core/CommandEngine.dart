import '../feature/model/command.dart';
import 'dart:io';

class CommandEngine {

  void execute(Command command) async {
    // 执行第一个系统命令 "ls"
    await executeCommand('ls');

    await executeCommand('adb', ['devices']);
  }

  Future<void> executeCommand(String command, [List<String> arguments = const []]) async {
    print('Executing command: $command ${arguments.join(' ')}');
    ProcessResult results = await Process.run(command, arguments);
    print(results.stdout);
  }

}
