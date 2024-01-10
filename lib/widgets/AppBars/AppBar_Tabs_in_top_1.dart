/*
* @Author: xskj
* @Date: 2024-01-02 10:26:13
* @LastEditors: xskj
* @LastEditTime: 2024-01-02 10:35:29
* @Description: Tab 在頂部的AppBar
*/
import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Cloud',
  'Beach',
  'Sunny',
];

class AppBarTabsInTop_1 extends StatelessWidget {
  const AppBarTabsInTop_1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('AppBar Sample'),
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 1;
      },
      scrolledUnderElevation: 4.0,
      shadowColor: Theme.of(context).shadowColor,
    );
  }
}
