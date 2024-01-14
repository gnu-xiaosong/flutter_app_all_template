/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: PC端配置类
 */

import 'package:app_template/config/AppConfig.dart';
import 'package:fluent_ui/fluent_ui.dart';

class WinConfig extends AppConfig {
  //windows AppBar的高度
  static final double WinAppBarHeight = 30;

  //侧边栏导航item
  static List<Map> tabBarBodyItems = [
    {
      "title": "home",
      "icon": Icon(FluentIcons.home),
      "enabled": true,
      "body": _NavigationBodyItem(),
      "items": [
        {
          "title": "home",
          "icon": Icon(FluentIcons.home),
          "enabled": true,
          "body": _NavigationBodyItem(),
          "items": []
        },
        {
          "title": "shopping",
          "icon": Icon(FluentIcons.shop),
          "enabled": true,
          "body": _NavigationBodyItem(),
          "items": []
        },
      ]
    },
    {
      "title": "shopping",
      "icon": Icon(FluentIcons.shop),
      "enabled": true,
      "body": _NavigationBodyItem(),
      "items": []
    },
    {
      "title": "person",
      "icon": Icon(FluentIcons.people_repeat),
      "enabled": true,
      "body": _NavigationBodyItem(),
      "items": []
    },
    {
      "title": "browser",
      "icon": Icon(FluentIcons.browser_screen_shot),
      "enabled": true,
      "body": _NavigationBodyItem(),
      "items": []
    },
  ];

//侧边栏底部
  static List tabsFooterItems = [
    {
      "title": "setting",
      "icon": Icon(FluentIcons.settings),
      "onTap": () {
        print("onTap setting");
      }
    },
    {
      "title": "question",
      "icon": Icon(FluentIcons.questionnaire),
      "onTap": () {
        print("onTap questionnaire");
      }
    },
  ];
}

Widget _NavigationBodyItem(
    {Widget header = const Text("header"),
    Widget content = const Text("content")}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [header, content],
    ),
  );
}
