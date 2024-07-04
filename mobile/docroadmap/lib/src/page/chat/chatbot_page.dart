import 'package:app/src/component/bubble_chat/keyboard.dart';
import 'package:app/src/component/bubble_chat/recieived_bubble.dart';
import 'package:app/src/component/bubble_chat/sent_bubble.dart';
import 'package:flutter/material.dart';

class PageChatbot extends StatefulWidget {
  const PageChatbot({super.key});

  static const routeName = '/';

  @override
  _PageChatbotState createState() => _PageChatbotState();
}

class _PageChatbotState extends State<PageChatbot> {
  final List<Widget> messages = [
    const ReceivedMessage(message: "Bonjour, je suis Doc RoadMap! Comment puis-je vous aider ?"),
    const SentMessage(message: "Je veux faire une demande de passport."),
    const ReceivedMessage(message: "Est-ce votre première demande de passport ?"),
    const SentMessage(message: "Oui"),
    const ReceivedMessage(message: "Où voulez-vous faire votre demande ? En France ou à l'étranger ?"),
    const SentMessage(message: "En france."),
    const ReceivedMessage(message: "En métropole ou en Outre-mer ?"),
    const SentMessage(message: "En métropole."),
    const ReceivedMessage(message: "Faites vous la demande pour une personne majeure ou un mineure ?"),
    const SentMessage(message: "Pour une personne majeure."),
    const ReceivedMessage(message: "Laquelle des situations suivantes correspond à votre situation ? \n- Vous avez une carte d'identité valide. \n- Vous avez une carte d'identité périmée. \n- Vous n'avez pas de carte d'identité."),
  ];

  void addMessage(String message) {
    setState(() {
      messages.add(SentMessage(message: message));
      if (message.toLowerCase().contains('valide')) {
        messages.add(const ReceivedMessage(message: "C'est noté ! Ta roadmap est en cours de création ! Dirige toi sur ta rodamap dans la page d'accueil !"));
      }
      if (message.toLowerCase().contains('périmée')) {
        messages.add(const ReceivedMessage(message: "C'est noté ! Ta roadmap est en cours de création ! Dirige toi sur ta rodamap dans la page d'accueil !"));
      }
      if (message.toLowerCase().contains('pas de carte')) {
        messages.add(const ReceivedMessage(message: "C'est noté ! Ta roadmap est en cours de création ! Dirige toi sur ta rodamap dans la page d'accueil !"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xfffbfbfb),
      appBar: AppBar(
        title: const Text('ChatBot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: KeyboardChat(onSend: addMessage),
          ),
        ],
      ),
    );
  }
}

