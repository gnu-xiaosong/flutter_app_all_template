/*
 * @Author: xskj
 * @Date: 2023-12-29 13:25:12
 * @LastEditors: xskj
 * @LastEditTime: 2023-12-29 13:40:14
 * @Description: 自定义画笔工具类
 */

import 'package:flutter/material.dart';

class CustomPainterManager extends CustomPainter {
  Function myPainter;
  CustomPainterManager(this.myPainter);

  //重载绘制
  @override
  void paint(Canvas canvas, Size size) {
    //从原点 (0, 0) 开始，宽度为 size.width，高度为 size.height 的矩形区域。
    var rect = Offset.zero & size;
    //调用绘制逻辑
    myPainter(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
