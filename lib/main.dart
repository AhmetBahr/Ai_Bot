import 'package:ai_bot_test/Page/CameraPage.dart';
import 'package:ai_bot_test/Page/MainPage.dart';
import 'package:ai_bot_test/Page/chatBotPage.dart';
import 'package:ai_bot_test/Service/services.dart';
import 'package:ai_bot_test/Theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ai_bot_test/navBar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //String Tanımlamalar
  final String appbarString = 'Cifci Dostu ChatBot';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMT Proje',
      theme: Provider.of<ThemeProvider>(context).themeData,
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
  int currentIndex = 0;
  List<Widget> pages = [
    Mainpage(),
    Camerapage(),
    const Chatbotpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          //Başlıktaki text yazısı data'ları
          widget.title,
          style: const TextStyle(
            fontFamily: 'SemiJoined',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.white,
        // selectedItemColor: Colors.green[800],
        iconSize: 28,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Camera Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "ChatBot",
          )
        ],
      ),
    );
  }
}
