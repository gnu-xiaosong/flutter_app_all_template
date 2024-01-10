import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("this is page for 0", style: TextStyle(color: Colors.red)),
    ));
  }
}
