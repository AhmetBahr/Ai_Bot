import 'package:ai_bot_test/Theme/constants.dart';
import 'package:ai_bot_test/Widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chatbotpage extends StatefulWidget {
  const Chatbotpage({super.key});

  @override
  State<Chatbotpage> createState() => _ChatbotpageState();
}

class _ChatbotpageState extends State<Chatbotpage> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ChatWidget(
                msg: chatMessages[index]["msg"].toString(),
                chatIndex:
                    int.parse(chatMessages[index]["chatIndex"].toString()),
              );
            },
          ),
        ),
        if (_isTyping) ...[
          const SpinKitThreeBounce(
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) {
                        //ToDO send messega
                      },
                      decoration: const InputDecoration.collapsed(
                          hintText: "Send message.. ",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.white54,
                      ))
                ],
              ),
            ),
          )
        ]
      ],
    )));
  }
}
