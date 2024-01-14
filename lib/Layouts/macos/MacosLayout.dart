import 'package:app_template/config/WinConfig.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:app_template/widgets/AppBars/appBar_windows_1.dart';
import 'package:app_template/widgets/windows/panes/PaneStyle1.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';
import '../../widgets/macos/sidebars/Sidebar1.dart';

class MacosLayout extends StatefulWidget {
  const MacosLayout({super.key});

  @override
  State<MacosLayout> createState() => _MacosLayoutState();
}

class _MacosLayoutState extends State<MacosLayout> {
  @override
  Widget build(BuildContext context) {
    //设置全局context
    WinConfig.context = context;

    //------layout布局--------
    return MacosWindow(
      //顶部区域
      titleBar: TitleBar(
        height: 30,
        alignment: Alignment.center,
        //box
        title: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orange,
            child: MoveWindow(
              child: Row(
                children: [
                  //侧边栏展开按钮
                  MacosIcon(
                    CupertinoIcons.arrow_right_arrow_left_circle_fill,
                    // color: CupertinoColors.activeBlue.color,
                    // size: 20,
                  ),
                  //其余自定义区域
                ],
              ),
            )),
        dividerColor: Colors.blue,
      ),
      //侧边栏-左边
      sidebar: sidebar1(context),
      //侧边栏-右边
      // endSidebar: sidebar1(context),
      //主体:tab切换
      child: WinConfig.tabBarBodyItems[
          Provider.of<OtherState>(context).otherModel.topIndex as int]['body'],
    );
  }
}
