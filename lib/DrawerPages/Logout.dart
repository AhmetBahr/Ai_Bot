import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Çıkış'),
          backgroundColor: Colors.green,
        ),
      );
}
