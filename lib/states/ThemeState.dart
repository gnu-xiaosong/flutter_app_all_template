/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 14:29:53
 * @Description: 主题共享状态  继承基类状态BasedState
 */

import 'dart:ui';

import 'package:app_template/config/ThemesConfig.dart';
import 'package:flutter/material.dart';
import 'AppState.dart';

class ThemeState extends AppState {
  // 获取当前主题，如果为设置主题，则默认使用蓝色主题
  final Map _theme = ThemesConfig.getThemes();
  Map get theme => _theme;

  // 主题改变后，通知其依赖项，新主题会立即生效应用x.setUser = user;
  set setTheme(Map themes) {
    /*
    * themes = {
    * "light": _LightTheme,
    * "dark": _darkTheme
    * }
    * _LightTheme、_darkTheme分别是从FlexColorScheme上配置直接取得的
    * 利用的是FlexColorScheme插件
    * 详情见:  //主题: 使用插件-插件配色地址：https://rydmike.com/flexcolorscheme/themesplayground-v7-2/#/
    * */
    // assert(themes != null, "themes配置不能为空");
    if (themes != null) {
      //更新主题配置
      ThemesConfig.LightTheme = themes["light"];
      ThemesConfig.darkTheme = themes['dark'];
      //通知widget更新
      notifyListeners();
    }
  }
}
