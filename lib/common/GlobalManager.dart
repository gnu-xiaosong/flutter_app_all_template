/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 全局管理器工具类
 */
import 'dart:convert';
import 'package:app_template/common/NotificationsManager.dart';
import 'package:app_template/common/ToolsManager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//应用配置信息
import '../models/index.dart';
//HttpManager管理工具类
import '../common/HttpManager.dart';
//本地通知管理
import './NotificationsManager.dart';

class GlobalManager {
  /***************↓↓↓↓↓↓全局参数变量初始化操作↓↓↓↓↓↓↓******************/
  // 11.是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  // 2.全局配置静态
  static AppModel appConfigModel = ToolsManager.loadAppModelConfig();
  /**************↑↑↑↑↑↑↑↑全局参数变量初始化操作↑↑↑↑↑↑↑↑***************/

  /****************↓↓↓↓↓↓工具类初始化操作↓↓↓↓↓↓↓**********************/
  //1.HttpManager工具类:采用了单例模式,让请求api类该Global类获取该实例化对象
  HttpManager _http = HttpManager.getInstance();
  HttpManager get GlobalHttp => _http; //用于继承的类访问

  /****************↑↑↑↑↑↑↑↑↑工具类初始化操作↑↑↑↑↑↑↑↑↑↑↑↑↑*******************/

  /*****************↓↓↓↓↓↓↓全局变量共享状态Model类初始化操作↓↓↓↓↓↓↓↓********/
  /*****************1.声明持续化存储变量*********************/
  static late SharedPreferences _userInfo;

  /*****************2.配置全局变量Model类*********************/
  //1.用户信息Model类
  static UserModel userInfo = UserModel()..theme = 2;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // -------------------管理类初始化--------------------
    //1.本地通知初始化(单例模式)
    NotificationsManager notification = NotificationsManager();
    notification.initialize();

    /****************3.持续化存储实例化对象-全局变量类******************/
    _userInfo = await SharedPreferences.getInstance();

    /****************4.获取持续化存储的Model对象******************/
    var _userInfoData = _userInfo.getString("userInfo");

    if (_userInfoData != null) {
      try {
        //获取Model数据对象
        userInfo = UserModel.fromJson(jsonDecode(_userInfoData));
      } catch (e) {
        print(e);
      }
    } else {
      //当Model中有一个不存在时
      print("json全局配置文件有误!");
    }
  }

  /**************5.持久化存储AppInfo信息 首先在实例化前先执行*************/
  static saveGlobalInfo() {
    _userInfo.setString("userInfo", jsonEncode(userInfo.toJson()));
    print("已保存");
  }
/*****************↑↑↑↑↑↑↑↑↑↑全局变量共享状态Model类初始化操作↑↑↑↑↑↑↑↑↑↑********/
}
