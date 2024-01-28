import 'package:app_template/boot/EmbedBoot.dart';
// import 'package:app_template/boot/WindowsBoot.dart';
import 'package:app_template/states/DarkState.dart';
import 'package:app_template/states/DescState.dart';
import 'package:app_template/states/OtherState.dart';
import 'package:app_template/states/ThemeState.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:io';
//全局变量
import 'boot/AndroidBoot.dart';
import 'boot/WindowsBoot.dart';
import 'common/GlobalManager.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => GlobalManager.init().then((e) async {
      await EasyLocalization.ensureInitialized();

      runApp(
          //屏幕适配
          ScreenUtilInit(
              designSize: const Size(360, 690),
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
            const initialSize = Size(1000, 650);
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
            child: const MaterialApplication()));
  }
}

class MaterialApplication extends StatefulWidget {
  const MaterialApplication({super.key});
  @override
  State<MaterialApplication> createState() => _MaterialApplicationState();
}

class _MaterialApplicationState extends State<MaterialApplication> {
  @override
  Widget build(BuildContext context) {
    // return MacosBoot();
    // return AndroidBoot();
    // return WindowsBoot();
    //嵌入式
    return EmbedBoot();
    //根据平台自定义选着平台
    // if (Platform.isIOS) {
    //   // 1.移动端(ios端)
    //   // return ;
    // } else if (Platform.isWindows) {
    //   // 2.windows端
    //   return WindowsBoot();
    // } else if (Platform.isMacOS) {
    //   // 3.macos端
    //   return MacosBoot();
    // } else if (Platform.isAndroid) {
    //   // 4.Android
    //   return AndroidBoot();
    // }

    return WindowsBoot();
  }
}
