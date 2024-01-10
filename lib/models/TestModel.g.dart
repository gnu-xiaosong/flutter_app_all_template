// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel()
  ..name = json['name'] as String
  ..age = json['age'] as num
  ..sex = json['sex'] as num
  ..email = json['email'] as String
  ..phone = json['phone'] as String
  ..addr = json['addr'] as String;

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'email': instance.email,
      'phone': instance.phone,
      'addr': instance.addr,
    };
