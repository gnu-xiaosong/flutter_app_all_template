import 'package:app_template/widgets/embed/appBars/EmbedAppBar.dart';
import 'package:app_template/widgets/embed/bodys/EmbedBody.dart';
import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/EmbedingConfig.dart' show isBasicLayout, isShowAppBar;
import '../../pages/embed/Home.dart';

class EmbedLayout extends StatefulWidget {
  const EmbedLayout({super.key});

  @override
  State<EmbedLayout> createState() => _EmbedLayoutState();
}

class _EmbedLayoutState extends State<EmbedLayout> {
  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }
}

BottomSheetScaffold _scaffold(BuildContext context) {
  return isShowAppBar
      ? BottomSheetScaffold(
          //顶部区域
          appBar: embedAppBar(),
          //底部主体部分: 两种形式:单页面 or 基本结构新形势
          body: isBasicLayout ? EmbedBody() : EmbedHome(),
          //底部抽屉
          bottomSheet: DraggableBottomSheet(
            body: Container(
              width: double.infinity,
              color: Colors.green,
            ),
          ),
        )
      : BottomSheetScaffold(
          //底部主体部分: 两种形式:单页面 or 基本结构新形势
          body: isBasicLayout ? EmbedBody() : EmbedHome(),
          //底部抽屉
          bottomSheet: DraggableBottomSheet(
            body: Container(
              width: double.infinity,
              color: Colors.green,
            ),
          ),
        );
}
