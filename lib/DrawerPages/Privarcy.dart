import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class PrivarcyPage extends StatelessWidget {
  const PrivarcyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Gizlilik'),
          backgroundColor: Colors.green,
        ),
      );
}
