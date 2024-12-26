import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // Kullanıcı ve bot mesajları
  final ImagePicker _picker = ImagePicker();
  final String httpIdText = "http://192.168.241.125:5000";
  final String httpIdFoto = "http://192.168.241.125:6000";

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add(
          {"user": message, "bot": "Typing..."}); // "Typing..." geçici yanıt
    });

    final url = Uri.parse(httpIdText + "/ask");
    //final url = Uri.parse("http://192.168.241.125:5000/ask");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"question": message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _messages.last["bot"] =
              data['answer'] ?? "No response."; // Yanıtı güncelle
        });
      } else {
        setState(() {
          _messages.last["bot"] = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _messages.last["bot"] = "Connection Error: $e";
      });
    }
  }

  Future<void> testPredictAPI(String imagePath) async {
    // final url = Uri.parse("http://192.168.241.125:5000/predict");
    final url = Uri.parse(httpIdFoto + "/predict");

    try {
      // Görüntü dosyasını base64'e çevir
      final bytes = await File(imagePath).readAsBytes();
      final base64Image = base64Encode(bytes);

      // JSON verisini hazırla
      final Map<String, String> data = {"image": base64Image};

      // POST isteği gönder
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      // API cevabını kontrol et
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        setState(() {
          _messages.last["bot"] =
              "${jsonResponse['prediction']}"; // Tahmin sonucunu göster
        });
      } else {
        setState(() {
          _messages.last["bot"] =
              "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _messages.last["bot"] = "Error occurred: $e";
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      // Görüntü seçimi
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Kullanıcı mesajı ekle
        setState(() {
          _messages.add({
            "user": "Image sent",
            "image": image.path, // Görüntü yolu
            "bot": "Typing...", // Geçici bot yanıtı
          });
        });

        // Resmi sunucuya gönder ve tahmin sonucunu güncelle
        await testPredictAPI(image.path);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Future<void> _saveToMainPage(String userMessage, String botResponse) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> savedCards = prefs.getStringList('cards') ?? [];
      savedCards.add(jsonEncode({"user": userMessage, "bot": botResponse}));
      await prefs.setStringList(
          'cards', savedCards); // Kaydetme işlemi tamamlanıyor
    } catch (e) {
      debugPrint("Error saving to SharedPreferences: $e");
    }
  }

  void _showPopup(String userMessage, String botResponse) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(userMessage),
          content: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(botResponse),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Kapat"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _saveToMainPage(userMessage, botResponse);
                Navigator.of(context).pop();
              },
              child: const Text("Kaydet"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isImage = message.containsKey('image');

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: isImage
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${message['user']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.file(File(message['image']!)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${message['bot']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${message['user']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${message['bot']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.info_outline,
                                        color: Colors.grey),
                                    onPressed: () {
                                      _showPopup(
                                        message['user']!,
                                        message['bot']!,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: _pickImage, // Görsel seçimi için buton
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = _controller.text;
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
