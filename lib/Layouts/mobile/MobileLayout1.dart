import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../widgets/drawers/MyDrawer.dart';
import '../../config/AppConfig.dart';
import '../../widgets/floatButtons/SpeedDial.dart';

late Function _setState;

class MobileLayout1 extends StatefulWidget {
  const MobileLayout1({super.key});
  @override
  State<MobileLayout1> createState() => _MobileLayout1State();
}

class _MobileLayout1State extends State<MobileLayout1> {
  @override
  Widget build(BuildContext context) {
    _setState = setState;
    return Scaffold(
      //悬浮按钮
      floatingActionButton: speed_dial(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //抽屉
      drawer: FractionallySizedBox(
          widthFactor: 0.64,
          child: Drawer(
            child: MyDrawer(),
          )),
      //pages页面
      body: //增加动画效果
          AnimationLimiter(
        child: AppConfig.bottomTabs[AppConfig.currentIndex]['page'] as Widget,
      ),
      //底部导航栏
      bottomNavigationBar:
          AppConfig.bottomNavigators[AppConfig.currentBottomNavigatorIndex](
              (index) => _setState(() => AppConfig.currentIndex = index),
              setState: _setState),
    );
  }
}
