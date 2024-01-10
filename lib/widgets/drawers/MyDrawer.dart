import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //头部部分
          UserAccountsDrawerHeader(
            //账号名
            accountName: Text("小松科技"),
            //邮件名
            accountEmail: Text("1829134124@qq.com"),
            //头像大小
            currentAccountPictureSize: const Size.fromRadius(35),
            //账号图片
            currentAccountPicture: Image.network(
                "https://img.51miz.com/Element/00/73/56/18/a1ad7af9_E735618_89494d1e.jpg"),
            //箭头颜色
            arrowColor: Colors.black,
          ),
          //头部以下
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                subtitle: Text("我是账号"),
                title: Text('account'.tr()),
              ),
              ListTile(
                leading: Icon(Icons.person_2),
                title: Text('person'.tr()),
              ),
              ListTile(
                leading: Icon(Icons.settings_input_component),
                title: Text('setting'.tr()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
