import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Chat Bot"),
        ),
        body: Center(
          child: Text("Chat"),
        ),
      );
}
