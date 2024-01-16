import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../widgets/sheets/mune_sheet.dart';

class EmbedHome extends StatefulWidget {
  const EmbedHome({super.key});

  @override
  State<EmbedHome> createState() => _EmbedHomeState();
}

class _EmbedHomeState extends State<EmbedHome> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        //滑出pane
        renderPanelSheet: false, //是否显示sheet
        slideDirection: SlideDirection.UP, //弹出方向：
        minHeight: 20,
        // maxHeight: 300,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: Text("Main Home page"),
          ),
        ));
  }

  //悬浮collapsed
  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

//悬浮panel
  Widget _floatingPanel() {
    final PADDING = window.physicalSize.width * 0.15;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.transparent,
            ),
          ]),
      margin: EdgeInsets.fromLTRB(PADDING, 10, PADDING, 100), //panel的margin
      //sheet内容
      child: mune_sheet(),
    );
  }
}
