// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolRoom _$ToolRoomFromJson(Map<String, dynamic> json) => ToolRoom(
      name: json['name'] as String,
      image: json['image'] as String,
      toolBoxList: (json['toolBoxList'] as List<dynamic>)
          .map((e) => ToolBox.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolRoomToJson(ToolRoom instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'toolBoxList': instance.toolBoxList,
    };
