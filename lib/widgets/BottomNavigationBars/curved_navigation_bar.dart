import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../config/AppConfig.dart';

Widget curved_navigation_bar(Function callback, {Function? setState}) {
  return CurvedNavigationBar(
    //背景颜色
    backgroundColor: Colors.blueAccent,
    items: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
    onTap: (index) => callback(index),
  );
}

//底部导航栏item
Widget _BottomNavigationBarItem(String label, IconData icon, int index) {
  return Icon(icon, size: 30);
}
