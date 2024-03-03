import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../widgets/drawers/MyDrawer.dart';
import '../../config/AppConfig.dart';
import '../../widgets/floatButtons/SpeedDial.dart';
import '../../widgets/sheets/mune_sheet.dart';

late Function _setState;
PanelController slideControl = PanelController();

class MobileLayout1 extends StatefulWidget {
  const MobileLayout1({super.key});
  @override
  State<MobileLayout1> createState() => _MobileLayout1State();
}

class _MobileLayout1State extends State<MobileLayout1> {
  bool _isDragging = false;
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
      body: SlidingUpPanel(
        controller: slideControl,
        //滑出pane
        renderPanelSheet: false, //是否显示sheet
        slideDirection: SlideDirection.UP, //弹出方向：
        minHeight: 0,
        // maxHeight: 300,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: //增加动画效果
            AnimationLimiter(
          child: AppConfig.bottomTabs[AppConfig.currentIndex]['page'] as Widget,
        ),
      ),

      //底部导航栏
      bottomNavigationBar: GestureDetector(
        onVerticalDragEnd: (DragEndDetails details) {
          _isDragging = false;
          slideControl.open();
        },
        onHorizontalDragStart: (details) {
          print("horizontal");
        },
        onTap: () {
          if (!_isDragging) {
            // 处理点击事件（如果需要的话）
            print('Tap Detected');
          }
        },
        //垂直拖拽结束
        // onVerticalDragDown: (detail) {
        //   //显示
        //   // slideControl.open();
        //   print("onVerticalDragEnd" + detail.globalPosition.toString());
        // },
        child:
            AppConfig.bottomNavigators[AppConfig.currentBottomNavigatorIndex](
                (index) => _setState(() => AppConfig.currentIndex = index),
                setState: _setState),
      ),
    );
  }

  //悬浮collapsed
  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 100, 24.0, 100),
      child: Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //悬浮panel
  Widget _floatingPanel() {
    final PADDING = window.physicalSize.width * 0.02;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.transparent,
            ),
          ]),
      margin: EdgeInsets.fromLTRB(PADDING, 0, PADDING, 24), //panel的margin
      //sheet内容
      child: mune_sheet(),
    );
  }
}
