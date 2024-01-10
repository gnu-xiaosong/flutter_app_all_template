/*
*
* */
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../../config/AppConfig.dart';

Widget water_drop_nav_bar(Function callback, {Function? setState}) {
  return WaterDropNavBar(
    backgroundColor: Colors.white,
    onItemSelected: (index) => callback(index),
    selectedIndex: AppConfig.currentIndex,
    barItems: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
  );
}

//底部导航栏item
BarItem _BottomNavigationBarItem(String label, IconData icon, int index) {
  return BarItem(
    filledIcon: icon,
    outlinedIcon: Icons.bookmark_border_rounded,
  );
}
