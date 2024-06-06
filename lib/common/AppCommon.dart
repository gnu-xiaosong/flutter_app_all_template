import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:upgrader/upgrader.dart';

Future<void> localAuth(BuildContext context) async {
  final localAuth = LocalAuthentication();
  final didAuthenticate = await localAuth.authenticate(
    localizedReason: 'Please authenticate'.tr(),
    options: const AuthenticationOptions(biometricOnly: true),
  );

  if (didAuthenticate && context.mounted) {
    Navigator.pop(context);
  }
}

// 应用更新
Upgrader appUpdater() {
  /*
  <?xml version="1.0" encoding="utf-8"?>
  <rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle">
      <channel>
          <title>Debt Now App - Appcast</title>
          <item>
              <title>Version 1.15.0</title>
              <description>Minor updates and improvements.</description>
              <pubDate>Sun, 30 Dec 2018 12:00:00 +0000</pubDate>
              <enclosure url="https://play.google.com/store/apps/details?id=com.moonwink.treasury" sparkle:version="1.15.0" sparkle:os="android" />
          </item>
      </channel>
  </rss>
   */
  print("-------------app upgrader monitor-------");
  const appcastURL =
      'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml';
  // 更新控制器
  final upgrader = Upgrader(
    storeController: UpgraderStoreController(
      onAndroid: () => UpgraderAppcastStore(appcastURL: appcastURL),
    ),
  );

  return upgrader;
}

// 屏幕安全锁
appScreenLock(BuildContext context) async {
  if (kDebugMode) {
    print('---------app screen lock-------');
  }

  final LocalAuthentication auth = LocalAuthentication();
  // ···
  final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
  final bool canAuthenticate =
      canAuthenticateWithBiometrics || await auth.isDeviceSupported();

  try {
    screenLock(
      context: context,
      // 标题
      title: Text("Please enter passcode".tr()),
      // 底部
      footer: Text("authenticate".tr()),
      // 重试次数
      maxRetries: 5,
      // 正确密码
      correctString: '1234',
      // 是否显示取消按钮
      canCancel: false,
      // 监测是否支持
      customizedButtonChild: canAuthenticate
          ? Icon(
              Icons.fingerprint,
              size: 40,
            )
          : null,
      customizedButtonTap: () async => await localAuth(context),
      // onOpened: () async => await localAuth(context),
    );
  } catch (e, stackTrace) {
    // 捕获异常并记录错误信息
    print('Error in appScreenLock: $e');
    print('Stack trace: $stackTrace');
  }
}
