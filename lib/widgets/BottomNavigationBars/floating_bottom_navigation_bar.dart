/*
* 文档配置:https://pub.dev/packages/floating_bottom_navigation_bar
*
* */

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

int currentIndex = 0;
Widget floating_bottom_navigation_bar(Function callback, {Function? setState}) {
  return FloatingNavbar(
    onTap: (index) {
      // var setState;
      setState!(() => currentIndex = index);
      callback(index);
    },
    currentIndex: currentIndex,
    items: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
  );
}

//底部导航栏item
FloatingNavbarItem _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return FloatingNavbarItem(icon: icon, title: label);
}
