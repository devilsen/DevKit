// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kit _$KitFromJson(Map<String, dynamic> json) => Kit(
      toolRoomList: (json['toolRoomList'] as List<dynamic>)
          .map((e) => ToolRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KitToJson(Kit instance) => <String, dynamic>{
      'toolRoomList': instance.toolRoomList,
    };
