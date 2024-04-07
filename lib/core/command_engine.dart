import 'dart:async';
import 'dart:io';

import 'package:devkit/core/device_scanner.dart';

import 'model/command.dart';

class CommandEngine {
  Future<String> execute(Command command) async {
    print('Executing command: $command');

    if (command.isOutput()) {
      return _executeCommandWithOutput(command.executable(), command.arguments());
    }

    var bashResult = await _executeBashCommand(command.executable(), command.arguments());
    if (bashResult.stderr.toString().isEmpty) {
      print('bash executing command: ${bashResult.stdout}');
      return bashResult.stdout;
    }

    var zshrcResult = await _executeZshrcCommand(command.getContent());
    if (zshrcResult.stderr.toString().isEmpty) {
      print('zshrc executing command: ${zshrcResult.stdout}');
      return zshrcResult.stdout;
    }

    var zProfileResult = await _executeZProfileCommand(command.getContent());
    if (zProfileResult.stderr.toString().isEmpty) {
      print('zProfile executing command: ${zProfileResult.stdout}');
      return zProfileResult.stdout;
    }

    return "";
  }

  Future<ProcessResult> _executeBashCommand(String command, [List<String> arguments = const []]) async {
    if (command == 'adb' && DeviceScanner.isConnectedDevice()) {
      arguments.insert(0, '-s');
      arguments.insert(1, DeviceScanner.selectedDevice.id);
    }

    return _processRun(command, arguments);
  }

  Future<ProcessResult> _executeZProfileCommand(String command) async {
    return _processRun('zsh', ['-c', 'source ~/.zprofile && $command']);
  }

  Future<ProcessResult> _executeZshrcCommand(String command) async {
    return _processRun('zsh', ['-c', 'source ~/.zshrc && $command']);
  }

  Future<ProcessResult> _processRun(String command, List<String> arguments) async {
    ProcessResult result = ProcessResult(0, 0, "", "");
    runZonedGuarded(() {
      result = Process.runSync(command, arguments);
      print('_processRun stdout: ${result.stdout}');
      print('_processRun stderr: ${result.stderr}');
    }, (error, stackTrace) {
      print('_processRun Unhandled exception: $error');
      result = ProcessResult(0, -1, "", "$error");
    });
    return result;
  }

  Future<String> _executeCommandWithOutput(String command, [List<String> arguments = const []]) async {
    String outputPath = 'download/front_1.png';

    Process process = await Process.start('adb', ['exec-out', 'screencap', '-d', '0', '-p']);
    File outputFile = File(outputPath);
    IOSink sink = outputFile.openWrite(); // 打开文件流以写入数据

    await for (List<int> data in process.stdout) {
      sink.add(data); // 逐个写入数据块
    }

    await sink.close(); // 关闭文件流

    return "";
  }
}
