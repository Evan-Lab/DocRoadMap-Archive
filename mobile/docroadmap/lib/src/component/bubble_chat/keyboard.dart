import 'package:flutter/material.dart';

class KeyboardChat extends StatefulWidget {
  final Function(String) onSend;

  const KeyboardChat({super.key, required this.onSend});

  @override
  State<KeyboardChat> createState() => _KeyboardChatState();
}

class _KeyboardChatState extends State<KeyboardChat> {
  final ScrollController scrollController = ScrollController();

  final TextEditingController textEditingController = TextEditingController();
  
  final FocusNode focusNode = FocusNode();

  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;

  void handleSend() {
    if (isTextFieldEnable) {
      widget.onSend(textEditingController.text);
      textEditingController.clear();
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: focusNode,
              controller: textEditingController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 10,
                ),
                hintText: 'Type your message',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => handleSend(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                ),
                onPressed: handleSend,
              ),
            ),
          ],
        ),
      ),
    );
  }
}