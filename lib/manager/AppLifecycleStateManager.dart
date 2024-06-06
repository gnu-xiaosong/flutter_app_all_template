/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 自定义函数工具
 */
// 应用首次运行时执行逻辑
// app首次启动时执行
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure_app_switcher/secure_app_switcher.dart';

import '../common/AppCommon.dart';

void appFirstRun() {
  print("-------------app is first run-------");
}

// app生命周期函数处理
/// 1. 进入应用前台时
void enterAppForward(BuildContext? appContext) {
  // 关闭应用遮罩保护
  SecureAppSwitcher.off();
  // 1. 应用安全锁
  appScreenLock(appContext!);
}

/// 2. 进入应用前台时
void enterAppBackward(BuildContext? appContext) {}

// 3.应用仍在运行，但与宿主 View 分离，通常在应用即将退出时使用。
appDetached() {}

// 4.应用在过渡期间短暂处于非活动状态，不接收用户输入
appInactive() {
  // 开启应用遮罩保护
  SecureAppSwitcher.on(iosStyle: SecureMaskStyle.blurLight);
}
