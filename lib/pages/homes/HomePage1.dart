import 'package:flutter/material.dart';
import '../../config/AppConfig.dart';

//---------------顶部tabs配置------------------
List TopTabs = <Map>[
  {
    "tab": Tab(
      //tab Widget
      icon: const Icon(Icons.cloud_outlined),
      text: "tab1", //tab名称
    ),
    //"tabView": TabView1()
  },
  {
    "tab": Tab(
      //tab Widget
      icon: const Icon(Icons.cloud_outlined),
      text: "tab2", //tab名称
    ),
    "tabView": ListView.builder(
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(' $index'),
        );
      },
    ),
  },
  {
    "tab": Tab(
      //tab Widget
      icon: const Icon(Icons.cloud_outlined),
      text: "tab3", //tab名称
    ),
    "tabView": ListView.builder(
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
    ),
  },
  {
    "tab": Tab(
      //tab Widget
      icon: const Icon(Icons.cloud_outlined),
      text: "tab4", //tab名称
    ),
    "tabView": ListView.builder(
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('$index'),
        );
      },
    ),
  },
];

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //initialIndex: 1,  //初始化tab index
      length: TopTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppConfig.appConfig['name']),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(tabs: <Widget>[for (var item in TopTabs) item['tab']]),
        ),
        body: TabBarView(
          children: <Widget>[for (var item in TopTabs) item['tabView']],
        ),
      ),
    );
  }
}
