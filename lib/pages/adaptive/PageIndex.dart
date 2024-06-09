import 'package:flutter/material.dart';

class PageIndex extends StatefulWidget {
  const PageIndex({super.key});

  @override
  State<PageIndex> createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("this is page for 1", style: TextStyle(color: Colors.red)),
    ));
  }
}
