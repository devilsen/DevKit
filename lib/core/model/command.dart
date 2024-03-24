import 'package:json_annotation/json_annotation.dart';

part 'command.g.dart';

@JsonSerializable()
class Command {
  final String name;
  final String content;

  const Command({
    required this.name,
    required this.content,
  });

  factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);
  Map<String, dynamic> toJson() => _$CommandToJson(this);

  String executable() {
    return content.split(' ').first;
  }

  List<String> arguments() {
    return content.split(' ').sublist(1);
  }

  @override
  String toString() {
    return 'Command{name: $name, content: $content}';
  }

  bool isOutput() {
    return content.contains(' > ');
  }

}