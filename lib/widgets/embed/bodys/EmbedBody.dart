import 'package:app_template/states/OtherState.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/EmbedingConfig.dart';

class EmbedBody extends StatefulWidget {
  const EmbedBody({super.key});

  @override
  State<StatefulWidget> createState() => _EmbedBodyState();
}

class _EmbedBodyState extends State<EmbedBody> {
  //顶部区域
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: isLeft ? leftNavigator(context) : bottomNavigator(context),
    );
  }
}

//底部navigator
Widget bottomNavigator(BuildContext context) {
  return Column(
    children: [
      //body
      Expanded(
        flex: 16 - space,
        child: tabs[Provider.of<OtherState>(context).otherModel.topIndex as int]
            ['body'],
      ),
      //导航
      Expanded(
          flex: space,
          child: Container(
            //导航栏宽度
            width: tabBarWidth,
            alignment: Alignment.center,
            child: NavigationBar(
              //指示器颜色
              indicatorColor: indicatorColor,
              selectedIndex:
                  Provider.of<OtherState>(context).otherModel.topIndex as int,
              onDestinationSelected: (index) {
                Provider.of<OtherState>(context, listen: false)
                    .setData(topIndex: index);
              },
              destinations: [
                for (var item in tabs)
                  NavigationDestination(
                    icon: item['icon'],
                    selectedIcon: item['select_icon'],
                    label: item['title'].toString().tr(),
                  ),
              ],
            ),
          ))
    ],
  );
}

//左边navigator
Widget leftNavigator(BuildContext context) {
  return Row(
    children: [
      //导航
      Expanded(
          flex: space,
          child: Container(
            //导航栏宽度
            width: tabBarWidth,
            alignment: Alignment.center,

            child: NavigationRail(
              //样式
              labelType: NavigationRailLabelType.all,
              //tabbar位置
              groupAlignment: 0,
              //指示器颜色
              indicatorColor: indicatorColor,
              selectedIndex:
                  Provider.of<OtherState>(context).otherModel.topIndex as int,
              onDestinationSelected: (index) {
                Provider.of<OtherState>(context, listen: false)
                    .setData(topIndex: index);
              },
              destinations: [
                for (var item in tabs)
                  NavigationRailDestination(
                    icon: item['icon'],
                    selectedIcon: item['select_icon'],
                    label: Text(item['title'].toString().tr()),
                  ),
              ],
            ),
          )),
      //body
      Expanded(
        flex: 16 - space,
        child: tabs[Provider.of<OtherState>(context).otherModel.topIndex as int]
            ['body'],
      ),
    ],
  );
}
