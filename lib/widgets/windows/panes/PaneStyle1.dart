import 'package:app_template/config/WinConfig.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

NavigationPane PaneStyle1(BuildContext context) {
  PaneDisplayMode displayMode = PaneDisplayMode.open;
  WinConfig.context = context;

  // // 定义显示模式和大小
  // PaneDisplayMode displayMode = PaneDisplayMode.compact;
  NavigationPaneSize paneSize = NavigationPaneSize(
    openWidth: 180, // 设置展开宽度
  );

  return NavigationPane(
      //被选择index
      selected: Provider.of<OtherState>(context).otherModel.topIndex as int,
      onChanged: (index) {
        Provider.of<OtherState>(context, listen: false)
            .setData(topIndex: index);
        // print("lll");
        // print(Provider.of<OtherState>(context).otherModel.topIndex);
      },
      // 是否显示
      displayMode: displayMode,
      //大小
      size: paneSize,
      // NavigationPaneSize(
      //   //展开宽度
      //   openWidth: ,
      //   //顶部宽度
      //   // topHeight: 20
      // ),
      //侧边栏item
      items: [
        for (var item in WinConfig.tabBarBodyItems) generatePaneItem(item)
      ],
      //侧边栏底部item
      footerItems: [
        for (var item in WinConfig.tabsFooterItems)
          PaneItemAction(
              icon: item['icon'],
              title: Text(item['title'].toString().tr()),
              onTap: item['onTap'])
      ]);
}

// 利用递归算法封装组件
PaneItem generatePaneItem(Map item) {
  //获取子递归树
  List items = item['items'];
  // 递归终止条件：即不存在子items
  if (items == null || items.isEmpty) {
    // 自定义PaneItem
    return PaneItem(
        icon: item['icon'],
        title: Text(item['title'].toString().tr()),
        body: item['body'],
        enabled: item['enabled']);
  }

  // 存在子item-----递归调用生成子项：即将每一个拥有items的项再进行generatePaneItem
  List<PaneItem> generatedItems = items.map((subItem) {
    //回调
    return generatePaneItem(subItem);
  }).toList();

  // 存在子项，使用PaneItemExpander
  return PaneItemExpander(
    icon: item['icon'],
    title: Text(item['title'].toString().tr()),
    body: _NavigationBodyItem(),
    items: generatedItems,
  );
}

Widget _NavigationBodyItem(
    {Widget header = const Text("header"),
    Widget content = const Text("content")}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [header, content],
    ),
  );
}
