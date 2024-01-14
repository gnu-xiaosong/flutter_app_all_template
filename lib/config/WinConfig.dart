/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: PC端配置类
 */

import 'package:app_template/config/AppConfig.dart';
import 'package:app_template/widgets/tabViews/WindowsTabView1.dart';
import 'package:fluent_ui/fluent_ui.dart';

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
      "icon": Icon(FluentIcons.home),
      "enabled": true,
      "body": WindowsTabView1(),
      "items": []
    },
    {
      "title": "shopping",
      "icon": Icon(FluentIcons.shop),
      "enabled": true,
      "body": TabView2(),
      "items": []
    },
    {
      "title": "person",
      "icon": Icon(FluentIcons.people_repeat),
      "enabled": true,
      "body": TabView3(),
      "items": []
    },
    {
      "title": "browser",
      "icon": Icon(FluentIcons.browser_screen_shot),
      "enabled": true,
      "body": TabView4(),
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
  ];

//侧边栏底部
  static List tabsFooterItems = [
    {
      "title": "setting",
      "icon": Icon(FluentIcons.settings),
      "onTap": () {
        showContentDialog(context!);
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
void showContentDialog(BuildContext context) async {
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
