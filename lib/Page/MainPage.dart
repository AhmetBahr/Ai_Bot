import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Map<String, String>> cards = [];

  Future<void> _loadCards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? savedCards = prefs.getStringList('cards');

      if (savedCards != null) {
        setState(() {
          cards = savedCards
              .map((card) => Map<String, String>.from(jsonDecode(card)))
              .toList();
        });
      }
    } catch (e) {
      debugPrint("Error loading from SharedPreferences: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Her satırda 2 kart
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];
            return Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card['user'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(card['bot'] ?? ''),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
