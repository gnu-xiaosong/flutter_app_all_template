/*
 * @Author: xskj
 * @Date: 2023-12-29 16:19:41
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 18:28:45
 * @Description: 主页面文件
 */

import 'package:app_template/states/DarkState.dart';
import 'package:app_template/states/DescState.dart';
import 'package:app_template/widgets/AppBars/AppBar_Tabs_in_top_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../states/ThemeState.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<DescState, ThemeState>(
        builder: (BuildContext context, desc, themeState, child) => Scaffold(
              //app顶部栏
             // appBar: ,
              //App主体
              body: const Index(),
            ));
  }
}

class Index extends StatefulWidget {
  const Index({super.key});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  test() {
    setState(() {
      DescState descState = DescState();
      descState.app..name = "APP1";
      Provider.of<DescState>(context, listen: false).setDesc = descState.app;
      Provider.of<DarkState>(context, listen: false).changeDarkMode();
    });
  }

  //重载方法
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      // onPressed: () => {Navigator.pushNamed(context, "/home")},
      onPressed: test,
      child: Text("测试"),
    ));
  }
}

/*class Index extends StatefulWidget {
  const Index({ super.key });

  @override
  State<Index> createState() => _IndexState();
}




class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}*/
