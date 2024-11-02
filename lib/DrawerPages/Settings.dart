import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Ayarlar'),
          backgroundColor: Colors.green,
        ),
      );
}
