import 'package:devkit/feature/model/command.dart';

class ToolBox {
  final String title;
  final List<Command> commands;

  const ToolBox({
    required this.title,
    required this.commands,
  });
}
