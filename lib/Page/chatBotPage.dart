import 'dart:developer';
import 'package:ai_bot_test/Service/api_service.dart';
import 'package:ai_bot_test/Widgets/chat_widget.dart';
import 'package:ai_bot_test/models/chat_model.dart';
import 'package:ai_bot_test/providers/models_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Chatbotpage extends StatefulWidget {
  const Chatbotpage({super.key});

  @override
  State<Chatbotpage> createState() => _ChatbotpageState();
}

class _ChatbotpageState extends State<Chatbotpage> {
  bool _isTyping = false;
  late TextEditingController textEditingController;
  late ScrollController _listeScrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    _listeScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listeScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Flexible(
          child: ListView.builder(
            controller: _listeScrollController,
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              return ChatWidget(
                msg: chatList[index].msg,
                chatIndex: (chatList[index].chatIndex),
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
        ],
        Material(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMesageFCY(
                        modelsProvider: modelsProvider,
                      );
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: "Send message.. ",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await sendMesageFCY(
                        modelsProvider: modelsProvider,
                      );
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white54,
                    ))
              ],
            ),
          ),
        )
      ],
    )));
  }

  void scrollListToEND() {
    _listeScrollController.animateTo(
        _listeScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMesageFCY({required ModelsProvider modelsProvider}) async {
    try {
      setState(
        () {
          _isTyping = true;
          chatList
              .add(ChatModel(msg: textEditingController.text, chatIndex: 0));
          textEditingController.clear();
          focusNode.unfocus();
        },
      );
      chatList.addAll(
        await ApiService.sendMessage(
          message: textEditingController.text,
          modelId: modelsProvider.getCurrentModel,
        ),
      );
      setState(() {});
    } catch (error) {
      log("error:  $error");
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}
