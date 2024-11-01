import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Giriş Yap'),
          backgroundColor: Colors.green,
        ),
      );
}
