/*
* @Author: xskj
* @Date: 2024-01-02 10:26:13
* @LastEditors: xskj
* @LastEditTime: 2024-01-02 10:35:29
* @Description: windows Tab 在頂部的AppBar
*/
import 'package:app_template/config/WinConfig.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';

Sidebar sidebar1(BuildContext context) {
  return Sidebar(
      //修饰
      decoration: BoxDecoration(color: Colors.white),
      //侧边栏最小宽度
      minWidth: 150,
      //侧边栏Widget
      builder: (context, scrollController) {
        return SidebarItems(
          currentIndex:
              Provider.of<OtherState>(context).otherModel.topIndex as int,
          onChanged: (index) {
            Provider.of<OtherState>(context, listen: false)
                .setData(topIndex: index);
          },
          items: [
            for (var item in WinConfig.tabBarBodyItems) generatePaneItem(item)
          ],
        );
      },
      //底部
      bottom: bottom());
}

//sidebar底部

Widget bottom() {
  return Column(
    children: [
      for (var item in WinConfig.tabsFooterItems)
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 12),
            ),
            onPressed: item['onTap'],
            child: Text(item['title'].toString().tr()))
    ],
  );
}

// 利用递归算法封装组件
SidebarItem generatePaneItem(Map item) {
  //获取子递归树
  List items = item['items'];
  // 递归终止条件：即不存在子items
  if (items == null || items.isEmpty) {
    // 自定义PaneItem
    return SidebarItem(
      leading: item['icon'],
      label: Text(item['title'].toString().tr()),
    );
  }

  // 存在子item-----递归调用生成子项：即将每一个拥有items的项再进行generatePaneItem
  List<SidebarItem> generatedItems = items.map((subItem) {
    //回调
    return generatePaneItem(subItem);
  }).toList();

  // 存在子项，使用PaneItemExpander
  return SidebarItem(
      leading: item['icon'],
      label: Text(item['title'].toString().tr()),
      disclosureItems: generatedItems);
}
