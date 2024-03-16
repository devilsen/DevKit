import 'dart:convert';

import 'package:devkit/feature/model/command.dart';
import 'package:devkit/feature/model/tool_box.dart';
import 'package:test/test.dart';

void main() {
  test('CommandJsonSerializable', () {
    final command1 = const Command(name: '浅色模式', content: 'adb devices');
    // final command2 = const Command(name: '深色模式', content: 'adb devices');

    final command1Json = command1.toJson();
    print("command1Json: $command1Json");

    final command2 = Command.fromJson(command1Json);
    print("command2: $command2");

    expect(command1.name, command2.name);
    expect(command1.content, command2.content);
  });

  test('toolBoxJsonSerializable', () {
    final command1 = const Command(name: '浅色模式', content: 'adb devices');
    final command2 = const Command(name: '深色模式', content: 'adb devices');

    final toolBox1 = ToolBox(title: 'ToolBox1', commands: [command1, command2]);

    final toolBox1Json = json.encode(toolBox1);
    print("toolBox1Json: $toolBox1Json");

    final toolBox2 = ToolBox.fromJson(json.decode(toolBox1Json) as Map<String, dynamic>);
    print("toolBox2: $toolBox2");

    expect(toolBox1.title, toolBox2.title);
    expect(toolBox1.commands[0].content, toolBox2.commands[0].content);
  });

}
