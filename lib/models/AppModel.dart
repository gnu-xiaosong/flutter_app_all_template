import 'package:json_annotation/json_annotation.dart';

part 'AppModel.g.dart';

@JsonSerializable()
class AppModel {
  AppModel();

  late String name;
  late String time;
  late String version;
  late String author;
  String? company;
  late String address;
  String? email;
  late String url;
  String? descriptions;
  Map<String,dynamic>? license;
  
  factory AppModel.fromJson(Map<String,dynamic> json) => _$AppModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppModelToJson(this);
}
