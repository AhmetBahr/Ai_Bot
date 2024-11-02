import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Yardım'),
          backgroundColor: Colors.green,
        ),
      );
}
