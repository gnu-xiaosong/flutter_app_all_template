/*
* 文档地址：https://pub-web.flutter-io.cn/packages/floating_bottom_bar/example
* */
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

Widget animated_bottom_navigation_bar(Function callback, {Function? setState}) {
  return AnimatedBottomNavigationBar(
    //底部tab导航item
    bottomBarItems: [
      for (var item in AppConfig.bottomTabs)
        _BottomNavigationBarItem(item['name'], item['icon'],
            AppConfig.bottomTabs.indexOf(item), callback)
    ],
    //中心图标
    bottomBarCenterModel: BottomBarCenterModel(
      centerBackgroundColor: Colors.blue,
      centerIcon: const FloatingCenterButton(
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 40.0,
        ),
      ),
      //中心tab展开item
      centerIconChild: [
        FloatingCenterButtonChild(
          child: const Icon(
            Icons.home,
            color: AppColors.white,
          ),
          onTap: () => print('Item1'),
        ),
        FloatingCenterButtonChild(
          child: const Icon(
            Icons.access_alarm,
            color: AppColors.white,
          ),
          onTap: () => print('Item2'),
        ),
        FloatingCenterButtonChild(
          child: const Icon(
            Icons.ac_unit_outlined,
            color: AppColors.white,
          ),
          onTap: () => print('Item3'),
        ),
      ],
    ),
  );
}

//底部导航栏item
BottomBarItemsModel _BottomNavigationBarItem(
    String label, IconData icon, int index, Function callback) {
  return BottomBarItemsModel(
    icon: Icon(icon, size: 22),
    iconSelected: Icon(icon, color: Colors.red, size: 23),
    title: label,
    dotColor: Colors.red,
    onTap: () => callback(index),
  );
}
