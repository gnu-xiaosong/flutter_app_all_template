import 'package:fluent_ui/fluent_ui.dart';

Widget custom_bottom_bar(Function callback, {Function? setState}) {
  return Container(
      width: double.infinity,
      height: 70,
      color: Colors.red,
      child: Center(
        child: Text("custom bottom bar"),
      ));
}
