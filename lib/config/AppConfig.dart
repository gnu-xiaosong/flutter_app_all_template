/*
 * @Author: xskj
 * @Date: 2023-12-30 18:54:06
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-30 21:52:07
 * @Description: APP配置类
 */

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../common/ToolsManager.dart';
import '../pages/mobile/Page2.dart';
import '../pages/mobile/Page3.dart';
import '../pages/mobile/PageHome.dart';

import '../pages/mobile/PagePerson.dart';
import '../../widgets/BottomNavigationBars/animated_notch_bottom_bar.dart';
import '../../widgets/BottomNavigationBars/bottom_navigation_bar_1.dart';
import '../../widgets/BottomNavigationBars/bubble_bottom_bar.dart';
import '../../widgets/BottomNavigationBars/convex_bottom_bar.dart';
import '../../widgets/BottomNavigationBars/curved_navigation_bar.dart';
import '../../widgets/BottomNavigationBars/fancy_bottom_navigation.dart';
import '../../widgets/BottomNavigationBars/flutter_snake_navigationbar.dart';
import '../../widgets/BottomNavigationBars/water_drop_nav_bar.dart';
//tabs view
import '../../widgets/tabViews/TabView2.dart';
import '../../widgets/tabViews/TabView3.dart';
import '../../widgets/tabViews/TabView4.dart';
import '../../widgets/tabViews/MobileTabView1.dart';
import '../widgets/BottomNavigationBars/animated_bottom_navigation_bar.dart';
import '../widgets/BottomNavigationBars/bottom_bar_with_sheet.dart';
import '../widgets/BottomNavigationBars/custom_bottom_bar.dart';
import '../widgets/BottomNavigationBars/floating_bottom_navigation_bar.dart';

class AppConfig extends ToolsManager {
  //引导页设置
  static List introduces = [
    {
      "color": const Color(0xFF9B90BC), //颜色
      "imageAssetPath":
          'https://img.zcool.cn/community/01f522574d04386ac72525ae116c37.jpg@1280w_1l_2o_100sh.jpg', //图片路径：支持网络图片
      "title": '页面三', //页面标题
      "body": '与来自不同地方的人联系', //主题部分文字介绍
      "doAnimateImage": true //是否图片做动画
    },
    {
      "color": const Color(0xFF9B90BC), //颜色
      "imageAssetPath":
          'https://img.zcool.cn/community/014efc599f7b6da80121ad7bf79df0.jpg@1280w_1l_2o_100sh.jpg', //图片路径：支持网络图片
      "title": '页面三', //页面标题
      "body": '与来自不同地方的人联系', //主题部分文字介绍
      "doAnimateImage": true //是否图片做动画
    },
    {
      "color": const Color(0xFF9B90BC), //颜色
      "imageAssetPath":
          'https://img.zcool.cn/community/01c46e5a45ecffa801206ed31c4a15.jpg@3000w_1l_0o_100sh.jpg', //图片路径：支持网络图片
      "title": '页面三', //页面标题
      "body": '与来自不同地方的人联系', //主题部分文字介绍
      "doAnimateImage": true //是否图片做动画
    }
  ];

  //---------------顶部tabs配置------------------
  static List TopTabs = <Map>[
    {
      "tab": Tab(
        //tab Widget
        //icon: const Icon(Icons.cloud_outlined),
        text: "tab1".tr(), //tab名称
      ),
      "tabView": MobileTabView1(),
    },
    {
      "tab": Tab(
        //tab Widget
        //icon: const Icon(Icons.cloud_outlined),
        text: "tab2".tr(), //tab名称
      ),
      "tabView": TabView2()
    },
    {
      "tab": Tab(
        //tab Widget
        // icon: const Icon(Icons.cloud_outlined),
        text: "tab3".tr(), //tab名称
      ),
      "tabView": TabView3()
    },
    {
      "tab": Tab(
        //tab Widget
        // icon: const Icon(Icons.cloud_outlined),
        text: "tab4".tr(), //tab名称
      ),
      "tabView": TabView4()
    },
  ];

  //获取App配置信息
  static Map<String, dynamic> appConfig = {
    "name": "app",
    "time": "xxxxx",
    "icon": 'assets/icons/twitter.svg', //logo图标
    "version": "v1.0",
    "author": "xxxx",
    "company?": "xxxxx",
    "address": "xxxxx",
    "email?": "xxxxx",
    "url": "xxxxxx",
    "descriptions?": "xxxxxxx",
    "license?": {
      "key": "mit",
      "name": "MIT License",
      "spdx_id": "MIT",
      "url": "https://api.github.com/licenses/mit",
      "node_id": "MDc6TGljZW5zZW1pdA=="
    }
  };

  //app底部tabs标签设置
  static Color activeColor = Colors.blue; //选中颜色
  static Color unActiveColor = Colors.black; //未选中颜色
  //默认index=0
  static int currentIndex = 0;
  //-------------tabs设置----------
  static List bottomTabs = <Map>[
    {"name": "home".tr(), "page": const PageHome(), "icon": Icons.home},
    {"name": "shopping".tr(), "page": const Page2(), "icon": Icons.shop},
    {
      "name": "browse".tr(),
      "page": const Page3(),
      "icon": Icons.browse_gallery
    },
    {"name": "person".tr(), "page": const PagePerson(), "icon": Icons.person}
  ];

  // 底部导航栏样式
  static List bottomNavigators = <Function>[
    //自定义bottom
    custom_bottom_bar,
    flutter_snake_navigationbar,
    animated_notch_bottom_bar,
    water_drop_nav_bar,
    convex_bottom_bar,
    bubble_bottom_bar,
    fancy_bottom_navigation,
    curved_navigation_bar,
    bottom_navigation_bar_1,
    bottom_bar_with_sheet,
    animated_bottom_navigation_bar,
    floating_bottom_navigation_bar
  ];
  //当前底部导航栏的索引
  static int currentBottomNavigatorIndex = 10;

  //http类配置参数
  static final Map<String, dynamic> httpConfig = {
    "baseUrl": "https://api.jixs.cc", //基础URL
    "connectTimeout": Duration(seconds: 30), //连接超时
    "receiveTimeout": Duration(seconds: 30), //接收超时
    "responseType": ResponseType.plain, //相应类型
  };

  // dio缓存全局配置
  static final cacheOptions = CacheOptions(
    // 缓存方式 A default store is required for interceptor.Volatile cache with LRU strategy.
    store: MemCacheStore(),
    // 默认缓存策略
    policy: CachePolicy.request,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7), //7天
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  // dio日志打印拦截参数设置
  static PrettyDioLogger prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90);
  // dio踪迹追踪插件
  static TalkerDioLogger talkerDioLogger = TalkerDioLogger(
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
      printResponseMessage: true,
    ),
  );
  // dio重试配置插件
  static RetryInterceptor getRetryInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      logPrint: print, //指定日志功能 (optional)
      retries: 3, // 重试次数 (optional)
      retryDelays: const [
        // 设置重试延迟间隔 (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    );
  }

  //  dio适配器设置
  static HttpClientAdapter get httpClientAdapter => Http2Adapter(
        ConnectionManager(
          idleTimeout: Duration(seconds: 10),
          onClientCreate: (_, config) => {
            // config.proxy = Uri.parse('http://login:password@192.168.0.1:8888'),
            config.onBadCertificate = (_) => true
          },
        ),
      );
}
