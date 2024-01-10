import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import '../../config/AppConfig.dart';

Widget flutter_snake_navigationbar(Function callback, {Function? setState}) {
  return SnakeNavigationBar.color(
    /* behaviour: snakeBarStyle,
    snakeShape: snakeShape,
    shape: bottomBarShape,
    padding: padding,
*/
    ///configuration for SnakeNavigationBar.color
    snakeViewColor: AppConfig.activeColor,
    selectedItemColor: AppConfig.activeColor,
    unselectedItemColor: Colors.blueGrey,

    ///configuration for SnakeNavigationBar.gradient
    //snakeViewGradient: selectedGradient,
    //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
    //unselectedItemGradient: unselectedGradient,

/*    showUnselectedLabels: showUnselectedLabels,
    showSelectedLabels: showSelectedLabels,*/

    currentIndex: AppConfig.currentIndex,
    onTap: (index) => callback(index),
    items: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(
            item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
    ],
  );
}

//底部导航栏item
BottomNavigationBarItem _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
