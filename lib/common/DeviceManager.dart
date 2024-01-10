/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 设备管理器工具类
 */
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class DeviceManager {
  //获取设备版本等信息
  Future<Map> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;
    return allInfo;
  }

  //获取用于查找文件系统上常用的位置。支持Android、iOS、Linux、macOS和Windows。并非所有平台都支持所有方法
  getDeviceCommonLocations() async {
    /*
    * 详情：https://pub-web.flutter-io.cn/packages/path_provider
    * */
    //临时文件目录
    final Directory tempDir = await getTemporaryDirectory();
    //应用文档目录
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    //下载目录:不支持Android
    final Directory? downloadsDir = await getDownloadsDirectory();
    //缓存目录
    final Directory ApplicationCacheDir = await getApplicationCacheDirectory();
  }

  //打开url
  openUrl(String url) async {
    /*
    * 注意要进行相关平台配置
    * 地址：https://pub-web.flutter-io.cn/packages/url_launcher
    * */
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  //共享插件：包括文件共享，邮件共享，图片等
  deviceItemShare() async {
    //共享至任意地方
    Share.share('共享内容');
    //共享至邮件
    Share.share('邮件内容', subject: '邮件主题');
    //共享文件
    var directory;
    final result = await Share.shareXFiles([
      XFile('${directory.path}/image1.jpg'),
      XFile('${directory.path}/image2.jpg')
    ], text: 'Great picture');

    //共享结果
    if (result.status == ShareResultStatus.success) {
      //共享成功
      print('Thank you for sharing the picture!');
    }
    if (result.status == ShareResultStatus.dismissed) {
      //放弃共享
      print('Did you not like the pictures?');
    }
  }

  //获取查询有关应用程序包的信息
  getApplicationPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
  }

  //获取设备电池信息
  Future<Battery> getDeviceBatteryInfo() async {
    var battery = Battery();
    //访问当前电池电量
    print(await battery.batteryLevel);
    //当状态(full, charging, discharge)变化时通知
    battery.onBatteryStateChanged.listen((BatteryState state) {
      // Do something with new state
    });
    //检查设备是否处于省电模式
    //目前仅支持Android、iOS和Windows平台
    print(await battery.isInBatterySaveMode);

    return battery;
  }

  // 获取有关设备连接的信息，无论设备是在蜂窝网络还是WiFi上运行，以及是否有互联网连接
  getDeviceConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // 连接上了移动网络时
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // 连接上wifi网络时
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // 连接上以太网时
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // 连接上VPN时
      // 关于ios和maco的提示:
      // [vpn]没有单独的网络接口类型。
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      // 连接上蓝牙时
    } else if (connectivityResult == ConnectivityResult.other) {
      // 我连接的网络不在上面提到的网络中
    } else if (connectivityResult == ConnectivityResult.none) {
      // 我没有连接任何网络。
    }
  }

  // 发现wifi网络信息并相应地进行配置
  deviceNetworkOfWifi() async {
    final info = NetworkInfo();

    //wifi信息
    final wifiName = await info.getWifiName(); // "FooNetwork"
    final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
    final wifiIP = await info.getWifiIP(); // 192.168.1.43
    final wifiIPv6 =
        await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
    final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
    final wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
    final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1
  }

  //访问加速度计、陀螺仪和磁力计传感器信息
  getDeviceSensors() {
    //描述设备的加速度，单位为m/s2
    /* 加速度计的离散读数。加速度计测量设备的速度。
    请注意，这些读数包括重力的影响。
    简单地说，您可以使用加速度计读数来判断设备是否在特定方向上移动*/
    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        print(event);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
    //用户描述设备的加速度
    /*与加速计事件一样，这是来自加速计的离散读数，用于测量设备的速度。
    但是，与加速度计事件不同，此事件不包括重力的影响*/
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        print(event);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]
    //描述了设备的旋转：陀螺仪的离散读数。陀螺仪测量设备在3D空间中的速率或旋转
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        print(event);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    // [GyroscopeEvent (x: 0.0, y: 0.0, z: 0.0)]
    //磁强计
    magnetometerEvents.listen(
      (MagnetometerEvent event) {
        print(event);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    // [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]
  }
}
