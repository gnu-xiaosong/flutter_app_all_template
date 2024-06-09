/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 18:28:45
 * @Description: 主页面文件
 */

import 'dart:ui';

import 'package:app_template/states/DarkState.dart';
import 'package:app_template/states/DescState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../config/AppConfig.dart';
import '../../states/ThemeState.dart';
import '../../widgets/sheets/mune_sheet.dart';

PanelController slideControl = PanelController();

class AdaptiveHome extends StatefulWidget {
  const AdaptiveHome({super.key});

  @override
  State<AdaptiveHome> createState() => _AdaptiveHomeState();
}

class _AdaptiveHomeState extends State<AdaptiveHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<DescState, ThemeState>(
        builder: (BuildContext context, desc, themeState, child) => Scaffold(
              //app顶部栏
              // appBar: ,
              //App主体
              body: const Index(),
            ));
  }
}

class Index extends StatefulWidget {
  const Index({super.key});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool _isDragging = false;
  var transitionDuration = 2;
  var selectedTab = 0;
  test() {
    setState(() {
      DescState descState = DescState();
      descState.app..name = "APP1";
      Provider.of<DescState>(context, listen: false).setDesc = descState.app;
      Provider.of<DarkState>(context, listen: false).changeDarkMode();
    });
  }

  //重载方法
  @override
  Widget build(BuildContext context) {
    // Define the children to display within the body at different breakpoints.
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 10; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 201, 197),
            height: 400,
          ),
        )
    ];
    return SlidingUpPanel(
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
        child: AdaptiveLayout(
          // An option to override the default transition duration.
          transitionDuration: Duration(milliseconds: transitionDuration),
          topNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.medium: SlotLayout.from(
              inAnimation: AdaptiveScaffold.leftOutIn,
              key: const Key('Primary Navigation Medium'),
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedTab,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    selectedTab = newIndex;
                  });
                },
                leading: Container(color: Colors.green),
                trailing: Container(color: Colors.brown),
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.inbox_outlined),
                    selectedIcon: Icon(Icons.inbox),
                    label: Text('Inbox'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.article_outlined),
                    selectedIcon: Icon(Icons.article),
                    label: Text('Articles'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.chat_outlined),
                    selectedIcon: Icon(Icons.chat),
                    label: Text('Chat'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.video_call_outlined),
                    selectedIcon: Icon(Icons.video_call),
                    label: Text('Video'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Inbox'),
                  ),
                ],
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: const Key('Primary Navigation Large'),
              inAnimation: AdaptiveScaffold.leftOutIn,
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedTab,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    selectedTab = newIndex;
                  });
                },
                extended: true,
                leading: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'REPLY',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 201, 197)),
                    ),
                    Icon(Icons.menu_open)
                  ],
                ),
                destinations: <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.inbox_outlined),
                    selectedIcon: Icon(Icons.inbox),
                    label: Text('Inbox'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.article_outlined),
                    selectedIcon: Icon(Icons.article),
                    label: Text('Articles'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.chat_outlined),
                    selectedIcon: Icon(Icons.chat),
                    label: Text('Chat'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.video_call_outlined),
                    selectedIcon: Icon(Icons.video_call),
                    label: Text('Video'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: Text('Inbox'),
                  ),
                ],
                // destinations: destinations
                //     .map((NavigationDestination destination) =>
                //         AdaptiveScaffold.toRailDestination(destination))
                //     .toList(),
                // trailing: trailingNavRail,
                // backgroundColor: navRailTheme.backgroundColor,
                // selectedIconTheme: navRailTheme.selectedIconTheme,
                // unselectedIconTheme: navRailTheme.unselectedIconTheme,
                // selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                // unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              ),
            ),
          }),

          // Primary navigation config has nothing from 0 to 600 dp screen width,
          // then an unextended NavigationRail with no labels and just icons then an
          // extended NavigationRail with both icons and labels.
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.medium: SlotLayout.from(
                inAnimation: AdaptiveScaffold.leftOutIn,
                key: const Key('Primary Navigation Medium'),
                builder: (_) => AdaptiveScaffold.standardNavigationRail(
                  selectedIndex: selectedTab,
                  onDestinationSelected: (int newIndex) {
                    setState(() {
                      selectedTab = newIndex;
                    });
                  },
                  leading: const Icon(Icons.menu),
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.inbox_outlined),
                      selectedIcon: Icon(Icons.inbox),
                      label: Text('Inbox'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.article_outlined),
                      selectedIcon: Icon(Icons.article),
                      label: Text('Articles'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.chat_outlined),
                      selectedIcon: Icon(Icons.chat),
                      label: Text('Chat'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.video_call_outlined),
                      selectedIcon: Icon(Icons.video_call),
                      label: Text('Video'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Inbox'),
                    ),
                  ],
                  // destinations: destinations
                  //     .map((NavigationDestination destination) =>
                  //         AdaptiveScaffold.toRailDestination(destination))
                  //     .toList(),
                  // backgroundColor: navRailTheme.backgroundColor,
                  // selectedIconTheme: navRailTheme.selectedIconTheme,
                  // unselectedIconTheme: navRailTheme.unselectedIconTheme,
                  // selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                  // unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
                ),
              ),
              Breakpoints.large: SlotLayout.from(
                key: const Key('Primary Navigation Large'),
                inAnimation: AdaptiveScaffold.leftOutIn,
                builder: (_) => AdaptiveScaffold.standardNavigationRail(
                  selectedIndex: selectedTab,
                  onDestinationSelected: (int newIndex) {
                    setState(() {
                      selectedTab = newIndex;
                    });
                  },
                  extended: true,
                  leading: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'REPLY',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 201, 197)),
                      ),
                      Icon(Icons.menu_open)
                    ],
                  ),
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.inbox_outlined),
                      selectedIcon: Icon(Icons.inbox),
                      label: Text('Inbox'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.article_outlined),
                      selectedIcon: Icon(Icons.article),
                      label: Text('Articles'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.chat_outlined),
                      selectedIcon: Icon(Icons.chat),
                      label: Text('Chat'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.video_call_outlined),
                      selectedIcon: Icon(Icons.video_call),
                      label: Text('Video'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Inbox'),
                    ),
                  ],
                  // destinations: destinations
                  //     .map((NavigationDestination destination) =>
                  //         AdaptiveScaffold.toRailDestination(destination))
                  //     .toList(),
                  // trailing: trailingNavRail,
                  // backgroundColor: navRailTheme.backgroundColor,
                  // selectedIconTheme: navRailTheme.selectedIconTheme,
                  // unselectedIconTheme: navRailTheme.unselectedIconTheme,
                  // selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                  // unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
                ),
              ),
            },
          ),
          // Body switches between a ListView and a GridView from small to medium
          // breakpoints and onwards.

          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) => AppConfig.bottomTabs[selectedTab]["page"],
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('Body Medium'),
                  builder: (_) => AppConfig.bottomTabs[selectedTab]["page"])
            },
          ),
          // BottomNavigation is only active in small views defined as under 600 dp
          // width.
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Bottom Navigation Small'),
                inAnimation: AdaptiveScaffold.bottomToTop,
                outAnimation: AdaptiveScaffold.topToBottom,
                builder: (_) => GestureDetector(
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
                    child: AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: <NavigationDestination>[
                        for (var item in AppConfig.bottomTabs)
                          NavigationDestination(
                            icon: Icon(item["icon"],
                                color: AppConfig.unActiveColor),
                            selectedIcon: Icon(item["icon"],
                                color: AppConfig.activeColor),
                            label: item["name"],
                          )
                      ],
                      currentIndex: selectedTab,
                      onDestinationSelected: (int newIndex) {
                        setState(() {
                          selectedTab = newIndex;
                        });
                      },
                    )),
              )
            },
          ),
        ),
      ),
    );
  }
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
