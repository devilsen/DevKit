import 'tool_room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kit.g.dart';

@JsonSerializable()
class Kit {
  final List<ToolRoom> categoryList;

  Kit({required this.categoryList});

  factory Kit.fromJson(Map<String, dynamic> json) => _$KitFromJson(json);
  Map<String, dynamic> toJson() => _$KitToJson(this);

}
