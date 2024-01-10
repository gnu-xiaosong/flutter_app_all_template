/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 12:42:13
 * @Description: APP系统配置model  继承ChangeNotifier类，并重写了notifyListeners()方法
 */
import 'package:flutter/cupertino.dart';
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
