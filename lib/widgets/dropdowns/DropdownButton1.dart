import 'package:app_template/common/GlobalManager.dart';
import 'package:app_template/common/NotificationsManager.dart';
import 'package:app_template/states/DarkState.dart';
import 'package:bruno/bruno.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';

class DropdownButton1 extends StatefulWidget {
  const DropdownButton1({super.key});

  @override
  State<DropdownButton1> createState() => _DropdownButton1State();
}

class _DropdownButton1State extends State<DropdownButton1> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
        customButton: const Icon(
          Icons.add,
          size: 40,
          color: Colors.blueAccent,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          //分割线
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ));
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [
    dark_mode,
    language,
    setting,
    add_alert
  ];
  static const List<MenuItem> secondItems = [notification];

  //配置
  static const dark_mode = MenuItem(text: 'dark', icon: Icons.dark_mode);
  static const language = MenuItem(text: 'language', icon: Icons.language);
  static const setting = MenuItem(text: 'setting', icon: Icons.settings);
  static const notification =
      MenuItem(text: 'notification', icon: Icons.notifications_none_outlined);
  static const add_alert = MenuItem(text: 'toast', icon: Icons.add_alert);

  //点击事件
  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text.tr(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.dark_mode:
        //Do something
        Provider.of<DarkState>(context, listen: false).changeDarkMode();
        break;
      case MenuItems.language:
        //切换语言
        _changeLocale(context);
        break;
      case MenuItems.setting:
        //弹窗提示
        showDialog(context);
        break;
      case MenuItems.add_alert:
        //toast提示
        showToast(context);
        break;
      case MenuItems.notification:
        //本地通知测试
        // NotificationsManager notice = GlobalManager.GlobalLocalNotification;
        // notice.showNotification(title: "通知", body: "我是通知内容");
        final NotificationsManager _localNotification = NotificationsManager();
        _localNotification.showNotification(title: "通知", body: "我是通知内容");
        break;
    }
  }
}

/// 切换语言
void _changeLocale(BuildContext context) async {
  print("当前语言:" + context.locale.toString());
  print("------------------语言切换---------------------");
  if (context.locale.toString() == 'zh_CH') {
    await context.setLocale(context.supportedLocales[0]);
  } else {
    await context.setLocale(context.supportedLocales[1]);
  }
}

//显示dialog
void showDialog(BuildContext context) {
  BrnDialogManager.showConfirmDialog(context,
      title: "标题内容标题内容标题内容标题内容", cancel: '取消', confirm: '确定', onCancel: () {
    EasyLoading.showError("failse");
  }, onConfirm: () {
    EasyLoading.showSuccess("ok");
  });
  // Dialogs.materialDialog(
  //     msg: 'Are you sure ? you can\'t undo this',
  //     title: "Delete",
  //     color: Colors.white,
  //     context: context,
  //     dialogWidth: kIsWeb ? 0.3 : null,
  //     onClose: (value) => print("returned value is '$value'"),
  //     actions: [
  //       IconsOutlineButton(
  //         onPressed: () {
  //           Navigator.of(context).pop(['Test', 'List']);
  //         },
  //         text: 'Cancel',
  //         iconData: Icons.cancel_outlined,
  //         textStyle: TextStyle(color: Colors.grey),
  //         iconColor: Colors.grey,
  //       ),
  //       IconsButton(
  //         onPressed: () {},
  //         text: "Delete",
  //         iconData: Icons.delete,
  //         color: Colors.red,
  //         textStyle: TextStyle(color: Colors.white),
  //         iconColor: Colors.white,
  //       ),
  //     ]);
}

//显示toast
void showToast(context) {
  /*
  * 配置文档地址：https://pub-web.flutter-io.cn/packages/flutter_easyloading
  *
  * */
  // EasyLoading.show(status: 'loading...');

  // EasyLoading.showProgress(0.3, status: 'downloading...');
  EasyLoading.showSuccess('Great Success!'.tr());
  // EasyLoading.showError('Failed with Error');
  // EasyLoading.showInfo('Useful Information.');
  // EasyLoading.showToast('Toast');
  // EasyLoading.dismiss();
}
