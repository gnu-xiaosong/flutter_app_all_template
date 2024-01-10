import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import '../common/GlobalManager.dart';
import '../routes/index.dart';
import '../states/DarkState.dart';
import '../states/DescState.dart';
import '../states/ThemeState.dart';

class WindowsBoot extends StatefulWidget {
  const WindowsBoot({super.key});

  @override
  State<WindowsBoot> createState() => _WindowsBootState();
}

class _WindowsBootState extends State<WindowsBoot> {
  //tabview
  int currentIndex = 0;
  List<Tab> tabs = [];

  /// Creates a tab for the given index
  Tab generateTab(int index) {
    late Tab tab;
    tab = Tab(
      text: Text('Document $index'),
      semanticLabel: 'Document #$index',
      icon: const FlutterLogo(),
      body: Container(
        color:
            Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
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

  @override
  Widget build(BuildContext context) {
    int topIndex = 0;
    return Consumer3<DescState, ThemeState, DarkState>(
        builder: (BuildContext context, desc, themeState, darkState, child) =>
            FluentApp(
              //国际化支持
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              //标题：名称
              title: desc.app.name.tr(),
              //跟随系统
              themeMode: ThemeMode.system,
              //生成tile时
              onGenerateTitle: (context) {
                return desc.app.name.tr();
              },
              //路由拦截
              onGenerateRoute: (settings) => onGenerateRoute(settings),
              //主题
              theme: FluentThemeData(
                accentColor: SystemTheme.accentColor.accent.toAccentColor(),
              ),
              //路由导航失败时
              // onUnknownRoute:,
              //是否显示调试标
              debugShowCheckedModeBanner: !GlobalManager.isRelease,
              home: NavigationView(
                //顶部tab
                // appBar: NavigationAppBar(
                //   leading: Icon(Icons.add),
                //   title: Text(desc.app.name.tr()),
                // ),
                //面板
                content: TabView(
                  tabs: tabs!,
                  currentIndex: currentIndex,
                  onChanged: (index) => setState(() => currentIndex = index),
                  tabWidthBehavior: TabWidthBehavior.equal,
                  closeButtonVisibility: CloseButtonVisibilityMode.always,
                  showScrollButtons: true,
                  onNewPressed: () {
                    setState(() {
                      final index = tabs!.length + 1;
                      final tab = generateTab(index);
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
                ),
              ),
            ));
  }
}

// 侧边栏tabs
Widget _NavigationBodyItem(
    {Widget header = const Text('hello Flutter'),
    Widget content = const Text('hello Content')}) {
  return Column(
    children: [header, content],
  );
}

List<NavigationPaneItem> items = [
  PaneItem(
    icon: const Icon(FluentIcons.home),
    title: const Text('Home'),
    body: _NavigationBodyItem(),
  ),
  PaneItemSeparator(),
  PaneItem(
    icon: const Icon(FluentIcons.issue_tracking),
    title: const Text('Track orders'),
    infoBadge: const InfoBadge(source: Text('8')),
    body: _NavigationBodyItem(
      header: Text('Badging'),
      content: Text(
        'Badging is a non-intrusive and intuitive way to display '
        'notifications or bring focus to an area within an app - '
        'whether that be for notifications, indicating new content, '
        'or showing an alert. An InfoBadge is a small piece of UI '
        'that can be added into an app and customized to display a '
        'number, icon, or a simple dot.',
      ),
    ),
  ),
  PaneItem(
    icon: const Icon(FluentIcons.disable_updates),
    title: const Text('Disabled Item'),
    body: _NavigationBodyItem(),
    enabled: false,
  ),
  PaneItemExpander(
    icon: const Icon(FluentIcons.account_management),
    title: const Text('Account'),
    body: _NavigationBodyItem(
      header: Text('PaneItemExpander'),
      content: Text(
        'Some apps may have a more complex hierarchical structure '
        'that requires more than just a flat list of navigation '
        'items. You may want to use top-level navigation items to '
        'display categories of pages, with children items displaying '
        'specific pages. It is also useful if you have hub-style '
        'pages that only link to other pages. For these kinds of '
        'cases, you should create a hierarchical NavigationView.',
      ),
    ),
    items: [
      PaneItemHeader(header: const Text('Apps')),
      PaneItem(
        icon: const Icon(FluentIcons.mail),
        title: const Text('Mail'),
        body: _NavigationBodyItem(),
      ),
      PaneItem(
        icon: const Icon(FluentIcons.calendar),
        title: const Text('Calendar'),
        body: _NavigationBodyItem(),
      ),
    ],
  ),
];
