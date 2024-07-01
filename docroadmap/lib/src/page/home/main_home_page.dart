
import 'package:app/src/component/card/card_home_main.dart';
import 'package:flutter/material.dart';

class PageHomeMain extends StatelessWidget {
  const PageHomeMain({Key? key}) : super(key: key);

  static const routeName = '/homemain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Main'),
          actions: const [],
        ),
        backgroundColor: const Color(0Xfffbfbfb),
        body: Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: ListView(
              children: const [
               CardHomeMain(width: 300, mediaHeightVal: 200),
              ],
            )));
  }
}