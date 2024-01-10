import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../config/AppConfig.dart';

Widget fancy_bottom_navigation(Function callback, {Function? setState}) {
  return FancyBottomNavigation(tabs: [
    for (var item in AppConfig.bottomTabs)
      _BottomNavigationBarItem(
          item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
  ], onTabChangedListener: (index) => callback(index));
}

//底部导航栏item
TabData _BottomNavigationBarItem(String label, IconData icon, int index) {
  return TabData(iconData: icon, title: label);
}
