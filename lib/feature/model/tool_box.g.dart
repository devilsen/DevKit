// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolBox _$ToolBoxFromJson(Map<String, dynamic> json) => ToolBox(
      title: json['title'] as String,
      commands: (json['commands'] as List<dynamic>)
          .map((e) => Command.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolBoxToJson(ToolBox instance) => <String, dynamic>{
      'title': instance.title,
      'commands': instance.commands,
    };
