import 'package:fluent_ui/fluent_ui.dart';

mune_sheet() {
  return Column(
    children: [
      Center(
        child: Text("menus"),
      ),

      //menus
      Expanded(
          child: Container(
        margin: EdgeInsets.fromLTRB(3, 3, 3, 13),
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.red,
      ))
    ],
  );
}
