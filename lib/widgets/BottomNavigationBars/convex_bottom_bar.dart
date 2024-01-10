/*
* 文档配置:https://github.com/hacktons/convex_bottom_bar/blob/master/README-zh.md
*
* */

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

Widget convex_bottom_bar(Function callback, {Function? setState}) {
  return ConvexAppBar(
    items: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
    onTap: (index) => callback(index),
  );
}

//底部导航栏item
TabItem<IconData> _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return TabItem(icon: icon, title: label);
}
