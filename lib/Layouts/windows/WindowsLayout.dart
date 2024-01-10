import 'package:fluent_ui/fluent_ui.dart';

//侧边栏导航
List<NavigationPaneItem> items = [
  PaneItem(
    icon: const Icon(FluentIcons.home),
    title: const Text('Home'),
    body: _NavigationBodyItem(),
  ),
  //分割线
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
  //可展开item
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

class WindowsLayout extends StatefulWidget {
  const WindowsLayout({super.key});

  @override
  State<WindowsLayout> createState() => _WindowsLayoutState();
}

class _WindowsLayoutState extends State<WindowsLayout> {
  int topIndex = 0;

  //显示模式
  PaneDisplayMode displayMode = PaneDisplayMode.auto;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      //顶部区域
      appBar: const NavigationAppBar(
        title: Text('NavigationView'),
      ),
      pane: NavigationPane(
        //被选择index
        selected: topIndex,
        onChanged: (index) => setState(() => topIndex = index),
        // 是否显示
        displayMode: displayMode,
        //navigation
        items: items,
        //footer
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: _NavigationBodyItem(),
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.add),
            title: const Text('Add New Item'),
            onTap: () {
// Your Logic to Add New `NavigationPaneItem`
              items.add(
                PaneItem(
                  icon: const Icon(FluentIcons.new_folder),
                  title: const Text('New Item'),
                  body: const Center(
                    child: Text(
                      'This is a newly added Item',
                    ),
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
