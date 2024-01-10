import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../config/AppConfig.dart';

Widget bubble_bottom_bar(Function callback, {Function? setState}) {
  return BubbleBottomBar(
    opacity: .2,
    currentIndex: AppConfig.currentIndex,
    onTap: (index) => callback(index),
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    elevation: 8,
    fabLocation: BubbleBottomBarFabLocation.end, //new
    hasNotch: true, //new
    hasInk: true, //new, gives a cute ink effect
    inkColor: Colors.black12, //optional, uses theme color if not specified
    items: <BubbleBottomBarItem>[
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
  );
}

//底部导航栏item
BubbleBottomBarItem _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return BubbleBottomBarItem(
      backgroundColor: Colors.red,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      activeIcon: Icon(
        icon,
        color: AppConfig.activeColor,
      ),
      title: Text(label));
}
