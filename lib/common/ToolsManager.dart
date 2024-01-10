/*
 * @Author: xskj
 * @Date: 2023-12-31 19:23:17
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-31 19:23:41
 * @Description: 工具管理器类
 */
import 'dart:ui';

import 'package:app_template/config/AppConfig.dart';
import 'package:app_template/models/AppModel.dart';

class ToolsManager {


  static AppModel loadAppModelConfig() {
    return AppModel.fromJson(AppConfig.appConfig);
  }


  //将普通颜色转化为Color对象
  static Color colorToMaterialColor(String color){
    //var c = "dc380d";
    //Color(int.parse(c,radix:16)|0xFF000000);//通过位运算符将Alpha设置为FF
    return Color(int.parse(color,radix:16)).withAlpha(255);  //通过方法将Alpha设置为FF
  }
}