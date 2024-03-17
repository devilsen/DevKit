import 'package:json_annotation/json_annotation.dart';

import 'tool_box.dart';

part 'tool_room.g.dart';

@JsonSerializable()
class ToolRoom {

  final String name;
  final String image;
  final List<ToolBox> toolBoxList;

  ToolRoom({required this.name, required this.image, required this.toolBoxList});

  factory ToolRoom.fromJson(Map<String, dynamic> json) => _$ToolRoomFromJson(json);
  Map<String, dynamic> toJson() => _$ToolRoomToJson(this);

}
