// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OtherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherModel _$OtherModelFromJson(Map<String, dynamic> json) => OtherModel()
  ..comments = json['comments'] as Map<String, dynamic>
  ..topIndex = json['topIndex'] as num
  ..isMaximized = json['isMaximized'] as bool;

Map<String, dynamic> _$OtherModelToJson(OtherModel instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'topIndex': instance.topIndex,
      'isMaximized': instance.isMaximized,
    };
