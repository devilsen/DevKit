import 'dart:io';

import 'model/command.dart';

class CommandEngine {
  void execute(Command command) async {
    print('Executing command: $command');
    if(command.isOutput()) {
      await executeCommandWithOutput(command.executable(), command.arguments());
      return;
    }
    await executeCommand(command.executable(), command.arguments());
  }

  Future<void> executeCommand(String command, [List<String> arguments = const []]) async {
    print('Executing command: $command ${arguments.join(' ')}');
    ProcessResult results = await Process.run(command, arguments);
    print(results.stdout);
  }

  Future<void> executeCommandWithOutput(String command, [List<String> arguments = const []]) async {
    String outputPath = 'download/front_1.png';

    Process process = await Process.start('adb', ['exec-out', 'screencap', '-d', '0', '-p']);
    File outputFile = File(outputPath);
    IOSink sink = outputFile.openWrite(); // 打开文件流以写入数据

    await for (List<int> data in process.stdout) {
      sink.add(data); // 逐个写入数据块
    }

    await sink.close(); // 关闭文件流
  }
}
