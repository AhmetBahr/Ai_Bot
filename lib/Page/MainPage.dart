import 'package:ai_bot_test/Page/CardDetialPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, String>> cards = [];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedCards = prefs.getStringList('cards');

    if (savedCards != null) {
      setState(() {
        cards = savedCards
            .map((savedCard) => Map<String, String>.from(jsonDecode(savedCard)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailPage(card: card),
                ),
              );

              if (result == true) {
                // Silme işlemi gerçekleşmişse kartları yeniden yükle
                _loadCards();
              }
            },
            child: Card(
              child: ListTile(
                title: Text(card['user'] ?? ''),
                subtitle: Text(card['bot']?.split('\n').first ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
