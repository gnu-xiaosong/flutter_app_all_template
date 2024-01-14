/*
* @Author: xskj
* @Date: 2024-01-02 10:26:13
* @LastEditors: xskj
* @LastEditTime: 2024-01-02 10:35:29
* @Description: windows Tab 在頂部的AppBar
*/
import 'package:app_template/config/AppConfig.dart';
import 'package:app_template/config/WinConfig.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:provider/provider.dart';
import '../../config/ThemesConfig.dart';

NavigationAppBar appBarWithWindows1(BuildContext context) {
  return NavigationAppBar(
      //背景颜色
      backgroundColor: ThemesConfig.LightTheme.primaryColor,
      //appBar高度
      height: WinConfig.WinAppBarHeight,

      //左边
      leading: appBarLeft(),
      //中间
      title: appBarCenter(),
      //右边
      actions: appBarRight(context));
}

//左边
Widget appBarLeft() {
  return Container(
      width: 100,
      alignment: Alignment.center,
      child: Container(
          width: double.infinity,
          //标题位置
          alignment: Alignment.center,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image(image: AssetImage(AppConfig.appConfig['icon'])),
                // Image.asset(
                //   AppConfig.appConfig['icon'],
                //   width: 4,
                //   height: 4,
                // ),
                Icon(Icons.adb),
                // Text(
                //   "left",
                //   style: TextStyle(fontSize: 13),
                // ),
              ])));
}

// 中间
Widget appBarCenter() {
  return MoveWindow(
    child: Container(
        width: double.infinity,
        color: Colors.red,
        //标题位置
        alignment: Alignment.center,
        child: Text("center")),
  );
}

//右边
Widget appBarRight(BuildContext context) {
  // size windows icon
  double winSize = 14.3;
  bool isMaximized = false;
  return Container(
      width: 120,
      color: Colors.green,
      //标题位置
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(FluentIcons.calculator_subtract, size: winSize),
            onPressed: () {
              //隐藏窗口
              appWindow.minimize();
            },
          ),
          IconButton(
            icon: Provider.of<OtherState>(context).otherModel.isMaximized
                ? Icon(FluentIcons.square_shape, size: winSize)
                : Icon(FluentIcons.chrome_restore, size: winSize),
            onPressed: () {
              Provider.of<OtherState>(context, listen: false).setIsMaximized();
              //扩大或缩小窗口
              appWindow.maximizeOrRestore();
              // _setState(() => );
            },
          ),
          IconButton(
            icon: Icon(FluentIcons.cancel, size: winSize),
            onPressed: () {
              //关闭窗口
              appWindow.close();
            },
          ),
        ],
      ));
}
