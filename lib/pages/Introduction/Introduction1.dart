/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 18:28:45
 * @Description: 安装介绍页面1
 */

import 'package:app_template/config/AppConfig.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

//配置引导页
List<PageModel> introducePages = [];

class Introduction1 extends StatefulWidget {
  Introduction1({super.key}) {
    for (var item in AppConfig.introduces) {
      introducePages.add(PageModel(
          color: item["color"],
          imageAssetPath: item["imageAssetPath"], //图片
          title: item["title"], //标题
          body: item["body"], //主题文字
          doAnimateImage: item["doAnimateImage"] //动画
          ));
    }
  }

  @override
  State<Introduction1> createState() => _Introduction1State();
}

class _Introduction1State extends State<Introduction1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: introducePages,
        showBullets: true,
        skipText: "skip".tr(),
        nextText: "next".tr(),
        finishText: "finish".tr(),
        skipCallback: () {
          print("Skip回调");
        },
        finishCallback: () {
          Navigator.pop(context);
          //跳转到首页
          Navigator.pushNamed(context, "home");
        },
      ),
    );
  }
}
