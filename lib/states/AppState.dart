/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 12:42:13
 * @Description: App全局配置共享状态  继承ChangeNotifier类，并重写了notifyListeners()方法
 */
import '../manager/GlobalManager.dart';
import '../models/index.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  /****************获取全局变量Model**************/
  /*
  * 主要用于继承该基类的子类进行使用或访问
  */
  //1.获取全局变量:用户信息
  UserModel get userInfo => GlobalManager.userInfo;

  /*
  * desc: 重写noticefy方法，便于自定义更新通知给依赖的Widget更新
  */
  @override
  void notifyListeners() {
    print("调用了更新");
    // 1.保存全局变量信息
    GlobalManager.saveGlobalInfo();

    // 2.调用父的notifyListeners更新Widget组件: 通知依赖的Widget更新
    super.notifyListeners();
  }
}
