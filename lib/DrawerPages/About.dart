import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Hakkında'),
          backgroundColor: Colors.green,
        ),
      );
}
