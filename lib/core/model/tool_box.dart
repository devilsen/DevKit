import 'package:json_annotation/json_annotation.dart';

import 'command.dart';

part 'tool_box.g.dart';

@JsonSerializable()
class ToolBox {
  final String title;
  final List<Command> commands;

  ToolBox({
    required this.title,
    required this.commands,
  });

  factory ToolBox.fromJson(Map<String, dynamic> json) => _$ToolBoxFromJson(json);
  Map<String, dynamic> toJson() => _$ToolBoxToJson(this);

  @override
  String toString() {
    return 'ToolBox{title: $title, commands: $commands}';
  }

}
