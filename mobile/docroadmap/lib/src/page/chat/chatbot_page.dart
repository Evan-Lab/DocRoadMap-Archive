import 'package:app/src/component/bubble_chat/keyboard.dart';
import 'package:app/src/component/bubble_chat/recieived_bubble.dart';
import 'package:app/src/component/bubble_chat/sent_bubble.dart';
import 'package:flutter/material.dart';

class PageChatbot extends StatelessWidget {
  const PageChatbot({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0Xfffbfbfb),
      appBar: AppBar(
        title: const Text('ChatBot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const ReceivedMessage(message: "Hi I am DocRoadMap, your very assistant"),
          const SentMessage(message: "I want a passport, but I do not know how to do"),
          const ReceivedMessage(message: "Minor or Major ?"),
          const SentMessage(message: "Major"),
          const ReceivedMessage(message: "Dom or Metropolis ?"),
          const SentMessage(message: "Dom"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Keyboard_Chat()
            ),
          
        ],
        
      ),
    );
  }
}