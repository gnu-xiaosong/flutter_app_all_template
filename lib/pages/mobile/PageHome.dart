import 'package:app_template/widgets/drawers/MyDrawer.dart';
import 'package:app_template/widgets/dropdowns/DropdownButton1.dart';
import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //initialIndex: 1,  //初始化tab index
      length: AppConfig.TopTabs.length,
      child: _scaffold(context),
    );
  }
}

BottomSheetScaffold _scaffold(BuildContext context) {
  return BottomSheetScaffold(
    appBar: AppBar(
      // 设置背景色
      backgroundColor: Colors.grey,
      // 设置 icon 主题
      iconTheme: IconThemeData(
        // 颜色
        color: Colors.blue,
        // 不透明度
        opacity: 0.5,
      ),
      // 标题居中
      //centerTitle: true,
      // 标题左右间距为
      leadingWidth: 50,
      //标题间隔
      titleSpacing: 1,
      //左边
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            iconSize: 35,
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              print("open drawer");
              Scaffold.of(context).openDrawer();
            });
      }),
      //标题--双标题
      title: Column(children: [
        Text(
          AppConfig.appConfig['name'].toString().tr(),
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          "我是小标题".tr(),
          style: const TextStyle(fontSize: 10),
        ),
      ]),
      //action（操作）right
      actions: [
        IconButton(
          onPressed: () {
            // customBackground(context);
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton1(),
        )
      ],
      // 自定义图标样式
      actionsIconTheme: IconThemeData(
        color: Colors.blue,
      ),
      shadowColor: Theme.of(context).shadowColor,
      //灵活区域
      flexibleSpace: SizedBox(
        width: double.infinity, //无限
        height: 160,
        child: Image.network(
          "https://ts1.cn.mm.bing.net/th/id/R-C.d4822697ad0424efafe6b62e5e6e0d1d?rik=ZdcMlu%2f2ng6ltA&riu=http%3a%2f%2fimg95.699pic.com%2fphoto%2f40141%2f5356.gif_wh860.gif&ehk=OMCk8kp7dU8UKPdcHORkcrjitRqABE0xoh7sa%2baGN4k%3d&risl=1&pid=ImgRaw&r=0",
          fit: BoxFit.cover,
        ),
      ),
      //底部部分
      bottom: TabBar(
          tabs: <Widget>[for (var item in AppConfig.TopTabs) item['tab']]),
    ),
    body: TabBarView(
      children: <Widget>[for (var item in AppConfig.TopTabs) item['tabView']],
    ),
    //抽屉
    drawer: const MyDrawer(),

    draggableBody: true,
    dismissOnClick: true,
    onWillPop: (() async {
      if (BottomSheetPanel.isOpen) {
        BottomSheetPanel.close();
        return false;
      } else {
        return true;
      }
    }),
    barrierColor: Colors.black54,
    //底部抽屉
    bottomSheet: DraggableBottomSheet(
      animationDuration: const Duration(milliseconds: 200),
      body: const BottomSheetBody(),
      header: const BottomSheetHeader(), //header is not required
    ),
  );
}

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6,
      color: Colors.red,
    );
  }
}

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("BottomSheetBody"),
    );
  }
}
