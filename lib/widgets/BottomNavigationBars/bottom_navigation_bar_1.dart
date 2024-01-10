import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

Widget bottom_navigation_bar_1(Function callback, {Function? setState}) {
  return BottomNavigationBar(
    items: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
    currentIndex: AppConfig.currentIndex,
    //点击tab
    onTap: (index) =>
        callback(index), // {setState(() => _currentIndex = index)},
    type: BottomNavigationBarType.fixed,
    unselectedLabelStyle: TextStyle(
      color: AppConfig.unActiveColor,
    ),
  );
}

//底部导航栏item
BottomNavigationBarItem _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return BottomNavigationBarItem(
    //icon设置
    icon: Icon(
      icon,
      color: Colors.black,
    ),
    //标签名
    label: label,
    //激活时icon
    activeIcon: Icon(
      icon,
      color: AppConfig.activeColor,
    ),
  );
}
