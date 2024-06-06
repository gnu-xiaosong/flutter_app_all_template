import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../Layouts/embeding/EmbedLayout.dart';
import '../manager/GlobalManager.dart';
import '../routes/index.dart';
import '../states/DarkState.dart';
import '../states/DescState.dart';
import '../states/ThemeState.dart';

class EmbedBoot extends StatefulWidget {
  const EmbedBoot({super.key});

  @override
  State<EmbedBoot> createState() => _EmbedBootState();
}

class _EmbedBootState extends State<EmbedBoot> {
  @override
  Widget build(BuildContext context) {
    print("------------------embed-----------------");
    return Consumer3<DescState, ThemeState, DarkState>(
        builder: (BuildContext context, desc, themeState, darkState, child) =>
            MaterialApp(
              //国际化支持
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              //标题：名称
              title: desc.app.name.tr(),
              //主题: 使用插件-插件配色地址：https://rydmike.com/flexcolorscheme/themesplayground-v7-2/#/
              //---------------------主题配色-------------------------
              theme: darkState.mode
                  ? ThemeData(brightness: Brightness.dark)
                  : themeState.theme['light'],
              darkTheme: themeState.theme['dark'],
              //跟随系统
              // themeMode: ThemeMode.system,
              //生成tile时
              onGenerateTitle: (context) {
                return desc.app.name.tr();
              },
              //颜色:默认跟随用户设置
              //color: themeState.theme,
              //路由
              // initialRoute: routes.keys.first.toString(),
              //入口
              home: EmbedLayout(),
              //名为"/"的路由作为应用的home(首页)
              // routes: routes,
              //路由表
              //路由拦截
              onGenerateRoute: (settings) => onGenerateRoute(settings),
              //路由导航失败时
              // onUnknownRoute:,
              //是否显示调试标
              debugShowCheckedModeBanner: !GlobalManager.isRelease,
              builder: EasyLoading.init(), // 1.toast初始化
            ));
  }
}
