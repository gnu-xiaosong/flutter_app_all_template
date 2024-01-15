import 'package:flutter/material.dart';

AppBar embedAppBar() {
  return AppBar(
    //left
    leading: left(),
    leadingWidth: 100,
    //center
    title: center(),
    //right
    actions: right(),
    // toolbarHeight: 40,
  );
}

left() {
  return Container(
    width: double.infinity,
    color: Colors.red,
    alignment: Alignment.center,
    child: Text("left"),
  );
}

center() {
  return Container(
    width: double.infinity,
    height: 40,
    color: Colors.greenAccent,
    alignment: Alignment.center,
    child: Text("center"),
  );
}

right() {
  return [
    Container(
      width: 90,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("right"),
    )
  ];
}
