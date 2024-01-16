/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: PC端配置类
 */

import 'package:app_template/config/AppConfig.dart';
import 'package:app_template/widgets/tabViews/CustomPaintTabView.dart';
import 'package:app_template/widgets/tabViews/MacosTabView1.dart';
import 'package:app_template/widgets/tabViews/WindowsTabView1.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'dart:io';
import '../widgets/tabViews/TabView2.dart';
import '../widgets/tabViews/TabView3.dart';
import '../widgets/tabViews/TabView4.dart';

class WinConfig extends AppConfig {
  //父级的BuildContext
  static BuildContext? context;

  //windows AppBar的高度
  static final double WinAppBarHeight = 30;

  //侧边栏导航item
  static List<Map> tabBarBodyItems = [
    {
      "title": "home",
      "icon": MacosIcon(CupertinoIcons.home),

      // Icon(
      //   Platform.isWindows ? FluentIcons.home : CupertinoIcons.home,
      //   size: 15,
      // ),
      "enabled": true,
      "body":
          CustomPaintTabView(), // Platform.isWindows ? WindowsTabView1() : MacosTabView1(),
      "items": []
    },
    {
      "title": "shopping",
      "icon": MacosIcon(CupertinoIcons.home),

      // Icon(
      //   Platform.isMacOS ? FluentIcons.shop : CupertinoIcons.shopping_cart,
      //   size: 15,
      // ),
      "enabled": true,
      "body": WindowsTabView1(),
      "items": []
    },
    {
      "title": "person",
      "icon": MacosIcon(CupertinoIcons.person),

      // Icon(
      //   FluentIcons.people_repeat,
      //   size: 15,
      // ),
      "enabled": true,
      "body": TabView3(),
      "items": []
    },
    {
      "title": "browser",
      "icon": MacosIcon(CupertinoIcons.bag_badge_minus),

      // Icon(
      //   FluentIcons.browser_screen_shot,
      //   size: 15,
      // ),
      "enabled": true,
      "body": TabView4(),
      "items": [
        {
          "title": "home",
          "icon": MacosIcon(CupertinoIcons.bag_badge_minus),

          // Icon(
          //   FluentIcons.home,
          //   size: 15,
          // ),
          "enabled": true,
          "body": _NavigationBodyItem(),
          "items": []
        },
        {
          "title": "shopping",
          "icon": MacosIcon(CupertinoIcons.bag_badge_minus),

          // Icon(
          //   FluentIcons.shop,
          //   size: 15,
          // ),
          "enabled": true,
          "body": _NavigationBodyItem(),
          "items": []
        },
      ]
    },
  ];

//侧边栏底部
  static List tabsFooterItems = [
    {
      "title": "setting",
      "icon": Icon(FluentIcons.settings),
      "onTap": () {
        print("setting");
        // showContentDialogMacos(context!);
        // showContentDialog(context!);
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

//生成Widget
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

//弹窗
void showContentDialogWin(BuildContext context) async {
  final result = await showDialog<String>(
    context: context,
    builder: (context) => ContentDialog(
      title: const Text('Delete file permanently?'),
      content: const Text(
        'If you delete this file, you won\'t be able to recover it. Do you want to delete it?',
      ),
      actions: [
        Button(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.pop(context, 'User deleted file');
            // Delete file here
          },
        ),
        FilledButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, 'User canceled dialog'),
        ),
      ],
    ),
  );
}

void showContentDialogMacos(BuildContext context) {
  showMacosAlertDialog(
    context: context,
    builder: (_) => MacosAlertDialog(
      appIcon: FlutterLogo(size: 64),
      title: Text(
        'Alert Dialog with Primary Action',
        style: MacosTheme.of(context).typography.headline,
      ),
      message: Text(
        'This is an alert dialog with a primary action and no secondary action',
        textAlign: TextAlign.center,
        style: MacosTypography.of(context).headline,
      ),
      primaryButton: PushButton(
        controlSize: ControlSize.large,
        child: Text('Primary'),
        onPressed: () {},
      ),
    ),
  );
}
