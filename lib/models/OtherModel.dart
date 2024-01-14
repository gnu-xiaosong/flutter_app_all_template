import 'package:json_annotation/json_annotation.dart';

part 'OtherModel.g.dart';

@JsonSerializable()
class OtherModel {
  OtherModel();

  late Map<String,dynamic> comments;
  late num topIndex;
  late bool isMaximized;
  
  factory OtherModel.fromJson(Map<String,dynamic> json) => _$OtherModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtherModelToJson(this);
}
