import 'package:flutter/material.dart';
import 'package:app/src/component/reusable/class.dart';
import 'package:app/src/tools/constant.dart';

class CardHzA extends StatefulWidget {
  const CardHzA({
    Key? key,
    required this.item,
    required this.index,
    required this.widthVal,
    required this.mediaHeightVal,
    required this.infoHeightVal,
  }) : super(key: key);

  final Paper item;
  final int index;
  final double widthVal;
  final double mediaHeightVal;
  final double infoHeightVal;

  @override
  _CardHzAState createState() => _CardHzAState();
}

class _CardHzAState extends State<CardHzA> {
  @override
  Widget build(BuildContext context) {
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
                  onTap: () {
                    
                  },
                  child: Container(
                    width: double.infinity,
                    height: widget.mediaHeightVal,
                    padding: EdgeInsets.all(fixPadding * 1.5),
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      image: const DecorationImage(
                         image: AssetImage('assets/passport.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                  ),
                ),
                )
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
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.white,
                    //onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: const Center(child: Text('Talk with assistant')),
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.white,
                    //onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: const Center(child: Text('Continue')),
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
