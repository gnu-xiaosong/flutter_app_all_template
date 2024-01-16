import 'dart:ui';

import 'package:app_template/widgets/embed/appBars/EmbedAppBar.dart';
import 'package:app_template/widgets/embed/bodys/EmbedBody.dart';
import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../config/EmbedingConfig.dart' show isBasicLayout, isShowAppBar;
import '../../pages/embed/Home.dart';
import '../../widgets/sheets/mune_sheet.dart';

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

Scaffold _scaffold(BuildContext context) {
  return isShowAppBar
      ? Scaffold(
          //顶部区域
          appBar: embedAppBar(),
          //底部主体部分: 两种形式:单页面 or 基本结构新形势
          body: isBasicLayout ? EmbedBody() : EmbedHome())
      : Scaffold(
          //底部主体部分: 两种形式:单页面 or 基本结构新形势
          body: isBasicLayout ? EmbedBody() : EmbedHome());
}
