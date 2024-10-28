import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';
import 'package:ai_bot_test/bottomNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //String Tanımlamalar
  final String appbarString = 'Cifci Dostu ChatBot';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMT Proje',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(200, 228, 178, 1)),
      ),
      home: MyHomePage(title: appbarString),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          //Başlıktaki text yazısı data'ları
          widget.title,
          style: const TextStyle(
              fontFamily: 'SemiJoined',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      bottomNavigationBar: Bottomnav(),
    );
  }
}
