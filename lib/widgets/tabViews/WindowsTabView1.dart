/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 12:42:13
 * @Description: home页 topTab切换标签tabview
 */

import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

int currentIndex = 0;
List<Tab> tabs = [];

Tab generateTab(int index, void Function(VoidCallback fn) setState) {
  late Tab tab;
  tab = Tab(
    text: Text('Document $index'),
    semanticLabel: 'Document #$index',
    icon: const FlutterLogo(),
    body: Container(
      color: Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
    ),
    onClosed: () {
      setState(() {
        tabs!.remove(tab);

        if (currentIndex > 0) currentIndex--;
      });
    },
  );
  return tab;
}

//主页面组件
Widget Index(void Function(VoidCallback fn) setState) {
  return TabView(
    tabs: tabs!,
    currentIndex: currentIndex,
    onChanged: (index) => setState(() => currentIndex = index),
    tabWidthBehavior: TabWidthBehavior.sizeToContent,
    closeButtonVisibility: CloseButtonVisibilityMode.always,
    showScrollButtons: true,
    onNewPressed: () {
      setState(() {
        final index = tabs!.length + 1;
        final tab = generateTab(index, setState);
        tabs!.add(tab);
      });
    },
    onReorder: (oldIndex, newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = tabs!.removeAt(oldIndex);
        tabs!.insert(newIndex, item);

        if (currentIndex == newIndex) {
          currentIndex = oldIndex;
        } else if (currentIndex == oldIndex) {
          currentIndex = newIndex;
        }
      });
    },
  );
}

//刷新控制器获取控制器
RefreshController _refreshController = RefreshController(initialRefresh: false);
void _onRefresh() async {
  // monitor network fetch
  await Future.delayed(const Duration(milliseconds: 1000));
  // if failed,use refreshFailed()
  _refreshController.refreshCompleted();
}

void _onLoading() async {
  // monitor network fetch
  await Future.delayed(const Duration(milliseconds: 1000));
  // if failed,use loadFailed(),if no data return,use LoadNodata()
  // items.add((items.length + 1).toString());
  // if (mounted) setState(() {});
  _refreshController.loadComplete();
}

class WindowsTabView1 extends StatefulWidget {
  const WindowsTabView1({super.key});

  @override
  State<WindowsTabView1> createState() => _WindowsTabView1State();
}

class _WindowsTabView1State extends State<WindowsTabView1> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Index(super.setState));
  }
}
