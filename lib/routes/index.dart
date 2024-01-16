/*
 * @Author: xskj
 * @Date: 2023-12-29 16:45:45
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 17:36:13
 * @Description: 路由设置
 */

import 'package:app_template/Layouts/embeding/EmbedLayout.dart';
import 'package:app_template/Layouts/windows/WindowsLayout.dart';
import 'package:app_template/pages/Introduction/Introduction1.dart';
import 'package:app_template/pages/logins/default/index/index.dart';
import 'package:flutter/material.dart';
//导入layout文件
import '../Layouts/mobile/MobileLayout1.dart';
import '../pages/Introduction/introduction2/introduction_animation_screen.dart';
import '../pages/logins/login1/Login1.dart';

//路由表
Map<String, WidgetBuilder> routes = {
  "/": (context) => const MobileLayout1(), //const MobileLayout1(),
  //const MobileLayout1(), //注册根路由:默认第一个为系统根路由： initialRoute: "/",
  "home": (context) => const MobileLayout1(), // home 页路由
  "introduce": (context) => Introduction1(), //介绍页路由
  "login": (context) => const Login(),
  "introductionAnimation": (context) =>
      const IntroductionAnimationScreen() //介绍页路由
};

//路由拦截处理
Function onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  print("--------------------");
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
