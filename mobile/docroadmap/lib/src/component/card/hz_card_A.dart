import 'package:app/src/component/passport_steps/passport_timeline.dart';
import 'package:app/src/component/reusable/class.dart';
import 'package:app/src/page/chat/chatbot_page.dart';
import 'package:app/src/tools/constant.dart';
import 'package:flutter/material.dart';

class CardHzA extends StatefulWidget {
  const CardHzA({
    super.key,
    required this.item,
    required this.index,
    required this.widthVal,
    required this.mediaHeightVal,
    required this.infoHeightVal,
  });

  final Paper item;
  final int index;
  final double widthVal;
  final double mediaHeightVal;
  final double infoHeightVal;

  @override
  _CardHzAState createState() => _CardHzAState();
}

class _CardHzAState extends State<CardHzA> {
  void _handleContinueButton() {
    if (widget.item.title == 'Passport') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerticalTimelinePassport(),
        ),
      );
    }
  }

  void _handleChatBotButton() {
    if (widget.item.title == 'Passport') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PageChatbot(),
        ),
      );
    }
  }

  String _getAssetForTitle(String title) {
    switch (title) {
      case 'Passport':
        return 'assets/passport.jpg';
      case 'Visa':
        return 'assets/visa.jpg';
      case 'Taxes':
        return 'assets/taxes.jpg';
      default:
        return 'assets/default.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    String assetImage = _getAssetForTitle(widget.item.title);

    return Container(
      width: widget.widthVal,
      margin: const EdgeInsets.only(top: 10.0, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: widget.mediaHeightVal,
                    padding: EdgeInsets.all(fixPadding * 1.5),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(assetImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: widget.infoHeightVal,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5.0),
                Text(
                  widget.item.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.item.description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: _handleChatBotButton,
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.white,
                    //onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Talk with assistant')),
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: _handleContinueButton,
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.white,
                    //onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Your roadmap')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
