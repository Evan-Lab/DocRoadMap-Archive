import 'package:flutter/material.dart';
import 'package:app/src/page/home/home_page.dart';
import 'package:app/src/tools/constant.dart';

class CardHomeMain extends StatefulWidget {
  const CardHomeMain({
    Key? key,
    required this.width,
    required this.mediaHeightVal,
  }) : super(key: key);

  final double width;
  final double mediaHeightVal;

  @override
  _CardHomeMainState createState() => _CardHomeMainState();
}

class _CardHomeMainState extends State<CardHomeMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width - fixPadding * 4.0,
      margin: const EdgeInsets.only(top: 10.0, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: whiteColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1.0,
            spreadRadius: 1.0,
            color: Colors.grey[300]!,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: widget.mediaHeightVal,
                padding: EdgeInsets.all(fixPadding * 1.5),
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/passport.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title', style: blackBigTextStyle),
                      const SizedBox(height: 5.0),
                      const Text('Description'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageHome(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Go to the next page'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
