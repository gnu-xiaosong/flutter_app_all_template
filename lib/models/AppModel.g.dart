// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppModel _$AppModelFromJson(Map<String, dynamic> json) => AppModel()
  ..name = json['name'] as String
  ..time = json['time'] as String
  ..version = json['version'] as String
  ..author = json['author'] as String
  ..company = json['company'] as String?
  ..address = json['address'] as String
  ..email = json['email'] as String?
  ..url = json['url'] as String
  ..descriptions = json['descriptions'] as String?
  ..license = json['license'] as Map<String, dynamic>?;

Map<String, dynamic> _$AppModelToJson(AppModel instance) => <String, dynamic>{
      'name': instance.name,
      'time': instance.time,
      'version': instance.version,
      'author': instance.author,
      'company': instance.company,
      'address': instance.address,
      'email': instance.email,
      'url': instance.url,
      'descriptions': instance.descriptions,
      'license': instance.license,
    };
