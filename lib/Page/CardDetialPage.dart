import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CardDetailPage extends StatelessWidget {
  final Map<String, String> card;

  const CardDetailPage({required this.card});

  Future<void> _deleteCard(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedCards = prefs.getStringList('cards');

    if (savedCards != null) {
      final updatedCards = savedCards
          .where((savedCard) =>
              jsonEncode(card) != savedCard) // Kartı filtreleyerek kaldır
          .toList();

      await prefs.setStringList(
          'cards', updatedCards); // Güncellenmiş kart listesini kaydet
      Navigator.pop(context, true); // MainPage'e silme sonucu ile dön
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Kartı Sil",
            style: TextStyle(fontFamily: 'Kanit'),
          ),
          content: const Text(
            "Bu kartı silmek istediğinizden emin misiniz?",
            style: TextStyle(fontFamily: 'Kanit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Popup'ı kapat
              },
              child: const Text(
                "İptal",
                style: TextStyle(fontFamily: 'Kanit'),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteCard(context); // Kartı sil ve MainPage'e dön
                Navigator.pop(context); // Popup'ı kapat
              },
              child: const Text(
                "Sil",
                style: TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Card Details",
          style: TextStyle(fontFamily: 'SemiJoined', color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Geri dönme işlemi
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context); // Silme onayı popup'ı
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card['user'] ?? '',
              style: const TextStyle(
                fontFamily: 'Kanit',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              card['bot'] ?? '',
              style: const TextStyle(
                fontFamily: 'Kanit',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
