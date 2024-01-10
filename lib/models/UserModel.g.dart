// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..username = json['username'] as String?
  ..token = json['token'] as String?
  ..theme = json['theme'] as num
  ..locale = json['locale'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'theme': instance.theme,
      'locale': instance.locale,
    };
