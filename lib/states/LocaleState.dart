/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description: 语言共享状态  继承基类状态BasedState
 */
import 'package:flutter/material.dart';
import '../manager/GlobalManager.dart';
import 'AppState.dart';

class LocaleState extends AppState {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale() {
    if (userInfo.locale == null) return null;
    var t = userInfo.locale?.split("_");
    return Locale(t![0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String? get locale => userInfo.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效应用x.setUser = user;
  set setLocale(String locale) {
    if (locale != userInfo.locale) {
      GlobalManager.userInfo.locale = locale;
      //通知widget更新
      notifyListeners();
    }
  }
}
