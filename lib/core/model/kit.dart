import 'package:json_annotation/json_annotation.dart';
import 'tool_room.dart';

part 'kit.g.dart';

@JsonSerializable()
class Kit {
  final List<ToolRoom> toolRoomList;

  Kit({required this.toolRoomList});

  factory Kit.fromJson(Map<String, dynamic> json) => _$KitFromJson(json);

  Map<String, dynamic> toJson() => _$KitToJson(this);

  static Kit empty() {
    return Kit(toolRoomList: []);
  }
}
