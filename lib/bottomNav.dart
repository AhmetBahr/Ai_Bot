import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomnavState();
}

class _BottomnavState extends State<BottomNav> {
  int currentIndex = 1;
  final screen = [];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      // backgroundColor: Colors.white,
      //Yani kendim bir renk atamadım ve gayet güzel bir yeşil tonu var nerden geliyor bilmiyorum
      //selectedItemColor: Colors.black,
      iconSize: 28,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: Colors.red),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "ChatBot",
            backgroundColor: Colors.red)
      ],
    );
  }
}

/*

items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Main',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'ChatBot',
          backgroundColor: Colors.green,
        ),
      ],


*/
