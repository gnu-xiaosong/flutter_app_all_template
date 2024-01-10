import 'package:json_annotation/json_annotation.dart';

part 'TestModel.g.dart';

@JsonSerializable()
class TestModel {
  TestModel();

  late String name;
  late num age;
  late num sex;
  late String email;
  late String phone;
  late String addr;
  
  factory TestModel.fromJson(Map<String,dynamic> json) => _$TestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
