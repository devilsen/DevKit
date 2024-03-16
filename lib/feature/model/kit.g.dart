// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kit _$KitFromJson(Map<String, dynamic> json) => Kit(
      categoryList: (json['categoryList'] as List<dynamic>)
          .map((e) => ToolRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KitToJson(Kit instance) => <String, dynamic>{
      'categoryList': instance.categoryList,
    };
