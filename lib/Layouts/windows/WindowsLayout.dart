import 'package:app_template/widgets/AppBars/appBar_windows_1.dart';
import 'package:app_template/widgets/windows/panes/PaneStyle1.dart';
import 'package:fluent_ui/fluent_ui.dart';

class WindowsLayout extends StatefulWidget {
  const WindowsLayout({super.key});

  @override
  State<WindowsLayout> createState() => _WindowsLayoutState();
}

class _WindowsLayoutState extends State<WindowsLayout> {
  @override
  Widget build(BuildContext context) {
    //------layout布局--------
    return NavigationView(
      //顶部区域
      appBar: appBarWithWindows1(context),
      //面板区域
      pane: PaneStyle1(context),
      //-------注意：如果设置content则appbar和pane则无效，即content为自定义面板（包括appbar和pane)------
      // content: ,
    );
  }
}
