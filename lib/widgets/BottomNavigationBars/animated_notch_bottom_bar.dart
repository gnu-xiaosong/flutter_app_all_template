import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import '../../config/AppConfig.dart';

Widget animated_notch_bottom_bar(Function callback, {Function? setState}) {
  return MoltenBottomNavigationBar(
    //tabbar的背景色
    barColor: Colors.blue,
    selectedIndex: AppConfig.currentIndex,
    onTabChange: (index) => callback(index),
    tabs: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
  );
}

//底部导航栏item
MoltenTab _BottomNavigationBarItem(String label, IconData icon, int index) {
  return MoltenTab(
      icon: Icon(icon),
      selectedColor: AppConfig.activeColor,
      unselectedColor: AppConfig.unActiveColor);
}
