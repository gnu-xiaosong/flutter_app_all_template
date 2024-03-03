/*
* 文档地址：https://pub-web.flutter-io.cn/packages/bottom_bar_with_sheet#getting-started
* */
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

late Function _callback;

Widget bottom_bar_with_sheet(Function callback, {Function? setState}) {
  _callback = callback;
  return Bottombarwithsheet();
}

class Bottombarwithsheet extends StatefulWidget {
  const Bottombarwithsheet({Key? key}) : super(key: key);

  @override
  State<Bottombarwithsheet> createState() => _BottombarwithsheetState();
}

class _BottombarwithsheetState extends State<Bottombarwithsheet> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomBarWithSheet(
      controller: _bottomBarController,
      bottomBarTheme: const BottomBarTheme(
        mainButtonPosition: MainButtonPosition.middle,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0.0 /*边缘完全不模糊*/,
              // blurRadius: 45/*边缘模糊*/,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        itemIconColor: Colors.grey,
        itemTextStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
        selectedItemTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 10.0,
        ),
      ),
      onSelectItem: (index) => _callback(index),
      sheetChild: Center(
        child: Text(
          "Another content".tr(),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      items: [
        for (var item in AppConfig.bottomTabs)
          _BottomNavigationBarItem(
              item['name'], item['icon'], AppConfig.bottomTabs.indexOf(item))
      ],
    );
  }
}

//底部导航栏item
BottomBarWithSheetItem _BottomNavigationBarItem(
    String label, IconData icon, int index) {
  return BottomBarWithSheetItem(icon: icon, label: label);
}
