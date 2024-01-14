## 快速开发工程模版——Flutter：适用Android、windows、ios等全平台


## 提示
* 适用Android的：https://github.com/gnu-xiaosong/flutter_app_Android_template
```
这是基于Flutter开发框架的快速开发模版。
```
### 文档地址
https://gnu-xiaosong.github.io/flutter_quaker_app/

### 版本

V1.0

### 特性

* 统一管理器模块调度
* 统一App参数配置
* 统一组件化管理
* 统一api管理
* 统一页面化管理
* 统一App路由管理
* 统一Layous管理
* 统一状态管理
* 统一实体模型管理
* 高度可定制化，模块化
* 强解耦，强可插性
* 封装了App基本结构，开发者只需专注于页面逻辑开发。

### 适用平台

* Android
* IOS
* Pc
* web

### 模版
* Android端
![img_2.png](img_2.png)
* Windows端
![img.png](img.png)
* Macos端
![img_1.png](img_1.png)
### 开发环境

* 语言：Dart
* 框架：Flutter
* 环境：Windows，Flutter框架

### 工程目录说明

```
├─.dart_tool
├─.idea
├─android                  ——————Android平台相关代码
├─assets                   ——————资源文件：img，font等
├─ios                      ——————IOS平台相关代码
├─lib                      ——————开发目录：flutter相关代码
│  ├─common                .........一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
│  ├─api                   .........api请求目录
│  ├─l10n                  .........国际化相关的类都在此目录下
│  ├─Layouts               .........App布局类都在此目录下
│  ├─models                .........Dart Model类会在此目录下
│  ├─config                .........配置文件目录
│  ├─pages                 .........页面存储目录：主要是构建App所需要的页面
│  ├─routes                .........存放所有路由页面类
│  ├─states                .........保存APP中需要跨组件共享的状态类
│  ├─widgets               .........APP内封装的一些Widget组件都在该目录下
│  └─main.dart             .........入口文件
├─linux                    ——————Linux平台相关代码
├─macos                    ——————MACOS平台相关代码
├─test                     ——————用于存放测试代码
├─web                      ——————Web平台相关代码
├─windows                  ——————Windows平台代码
├─analysis_options.yaml    ——————分析dart语法的文件，老项目升级成新项目有警告信息的话可以删掉此文件
└─pubspec.yaml             ——————配置文件，一般存放一些第三方库的依赖。
```

### 使用说明

#### 第一步。git clone 该项目到本地

#### 第二步。安装相关依赖  flutter pub get

#### 第三步。启动项目：flutter run

### 配置说明

在config目录下AppConfig.dart文件中配置APP相关参数。

```dart
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

  //获取App配置信息
  static Map<String, dynamic> appConfig = {
    "name": "测试App",
    "time": "xxxxx",
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
    {"name": "首页", "page": const PageHome(), "icon": Icons.home},
    {"name": "购物", "page": const Page2(), "icon": Icons.shop},
    {"name": "浏览", "page": const Page3(), "icon": Icons.browse_gallery},
    {"name": "我的", "page": const Page4(), "icon": Icons.person}
  ];

  // 底部导航栏样式
  static List bottomNavigators = <Function>[
    flutter_snake_navigationbar,
    animated_notch_bottom_bar,
    water_drop_nav_bar,
    convex_bottom_bar,
    bubble_bottom_bar,
    fancy_bottom_navigation,
    curved_navigation_bar,
    bottom_navigation_bar_1
  ];
  //当前底部导航栏的索引
  static int currentBottomNavigatorIndex = 3;

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

```
参考：https://bdlukaa.github.io/fluent_ui/#/surfaces/tiles
更新日志：
- 2024.1.6 增加了notification本地化通知插件，并且进行了工具类封装,以及主题插件配置
- 2024.1.7 增加下拉刷新以及微光效果，修改目录结构,以及登录注册页面