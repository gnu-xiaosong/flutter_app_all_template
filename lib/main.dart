// import 'package:app_template/boot/WindowsBoot.dart';
import 'package:app_template/config/AppConfig.dart';
import 'package:app_template/database/LocalStorage.dart';
import 'package:app_template/states/DarkState.dart';
import 'package:app_template/states/DescState.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:app_template/states/ThemeState.dart';
import 'package:app_template/tool/create_database.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:upgrader/upgrader.dart';
import 'dart:io';
//全局变量
import 'boot/AdaptiveBoot.dart';
import 'boot/AndroidBoot.dart';
import 'boot/EmbedBoot.dart';
import 'boot/WindowsBoot.dart';
import 'boot/MacosBoot.dart';
import 'package:easy_localization/easy_localization.dart';

import 'common/AppCommon.dart';
import 'database/daos/UserDao.dart';
import 'manager/AppLifecycleStateManager.dart';
import 'manager/GlobalManager.dart';

BuildContext? appContext;

void main() => GlobalManager.init().then((e) async {
      await EasyLocalization.ensureInitialized();
      // 设置全局断点
      ResponsiveSizingConfig.instance.setCustomBreakpoints(
        const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
      );
      runApp(ScreenUtilInit(
          //屏幕适配:自适应大小
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => GetMaterialApp(
                  home: EasyLocalization(
                      supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('zh', 'CN')
                  ],
                      path:
                          'assets/translations', // <-- change the path of the translation files
                      child: const App()))));

      try {
        // 初始化自定义窗口
        if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
          doWhenWindowReady(() {
            final win = appWindow;
            const initialSize = Size(500, 650);
            win.minSize = initialSize;
            win.size = initialSize;
            win.alignment = Alignment.center;
            win.title = "Custom window with Flutter";
            win.show();
          });
      } catch (e) {
        print("current platform unsupport Windows!");
      }
    });

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    appContext = context;
    print("Locale:${context.locale}");
    return MultiProvider(
        providers: [
          //全局配置共享状态
          ChangeNotifierProvider<DescState>(create: (_) => DescState()),
          //全局主题共享状态
          ChangeNotifierProvider<ThemeState>(create: (_) => ThemeState()),
          //全局暗夜模式
          ChangeNotifierProvider<DarkState>(create: (_) => DarkState()),
          //其他控制状态
          ChangeNotifierProvider<OtherState>(create: (_) => OtherState())
        ],
        child: RefreshConfiguration(
            //----------------- 下拉刷新全局配置-------------------
            // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
            headerBuilder: () => const WaterDropHeader(),
            // 配置默认底部指示器
            footerBuilder: () => const ClassicFooter(),
            // 头部触发刷新的越界距离
            headerTriggerDistance: 80.0,
            // 自定义回弹动画,三个属性值意义请查询flutter api
            springDescription:
                const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
            //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
            maxOverScrollExtent: 100,
            // 底部最大可以拖动的范围
            maxUnderScrollExtent: 0,
            //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
            enableScrollWhenRefreshCompleted: true,
            //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
            enableLoadingWhenFailed: true,
            // Viewport不满一屏时,禁用上拉加载更多功能
            hideFooterWhenNotFull: false,
            // 可以通过惯性滑动触发加载更多
            enableBallisticLoad: true,
            // 应用更新监测
            child: UpgradeAlert(
                // 样式
                dialogStyle: UpgradeDialogStyle.material,
                // 更新器
                upgrader: appUpdater(),
                child: const MaterialApplication())));
  }
}

class MaterialApplication extends StatefulWidget {
  const MaterialApplication({super.key});
  @override
  State<MaterialApplication> createState() => _MaterialApplicationState();
}

class _MaterialApplicationState extends State<MaterialApplication>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // app生命周期函数
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 应用程序进入前台时执行的操作
      print('--------App has entered the foreground-------');
      // 您可以在这里添加需要执行的代码，例如刷新数据
      enterAppForward(appContext);
    } else if (state == AppLifecycleState.paused) {
      // 应用程序进入后台时执行的操作
      print('--------App has entered the background--------');
      // 您可以在这里添加需要执行的代码，例如保存数据
      enterAppBackward(appContext);
    } else if (state == AppLifecycleState.inactive) {
      //应用程序处于非活动状态，并且不会接收用户输入
      print("-------App has inactive---");
      appInactive();
    } else if (state == AppLifecycleState.detached) {
      // 说明：应用程序仍在 Flutter 引擎中运行，但与宿主 View 分离。在移动平台中，这种状态通常出现在应用程序被完全退出之前，用于执行一些清理工作。
      // 使用场景：在应用程序即将退出时执行清理操作，比如释放资源或保存最后的状态数据。

      print("-------App has detached---");
      appDetached();
    } else if (state == AppLifecycleState.hidden) {
      print(" ------------app has hidden--------");
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    // 自适应布局
    return ResponsiveBreakpoints.builder(
        // 屏幕断点
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (AppConfig.systemAdaptive) {
              // 自适应系统
              return const AdaptiveBoot();
            }
            // Check the sizing information here and return your UI
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              // desktop
              if (Platform.isWindows) {
                // windows
                return WindowsBoot();
              }
              return MacosBoot();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              // table
              return EmbedBoot();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              // mobile
              if (Platform.isIOS) {
                // 1.移动端(ios端)
                // return ;
              }
              return AndroidBoot();
            }

            if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
              // watch
              return EmbedBoot();
            }

            return const AdaptiveBoot();
          },
        ));
  }
}
