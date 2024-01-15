import 'package:flutter/material.dart';

class EmbedHome extends StatefulWidget {
  const EmbedHome({super.key});

  @override
  State<EmbedHome> createState() => _EmbedHomeState();
}

class _EmbedHomeState extends State<EmbedHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey,
      child: Center(
        child: Text("Main Home page"),
      ),
    );
  }
}
