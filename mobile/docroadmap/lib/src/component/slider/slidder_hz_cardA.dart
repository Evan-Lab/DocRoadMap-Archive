import 'package:app/src/component/card/hz_cardA.dart';
import 'package:app/src/component/reusable/class.dart';
import 'package:app/src/tools/constant.dart';
import 'package:flutter/material.dart';

class SliderPaperHome extends StatefulWidget {
  const SliderPaperHome({
    Key? key,
  }) : super(key: key);

  @override
  _SliderPaperHome createState() => _SliderPaperHome();
}

class _SliderPaperHome extends State<SliderPaperHome> {
  final List<Paper> lstItems = [
    Paper(
        title: 'Passport',
        description: 'Passport',
        imageUrl: 'assets/passport.jpg'),
    Paper(title: 'Visa', description: 'Visa', imageUrl: 'assets/visa.jpg'),
    Paper(title: 'Taxes', description: 'Taxes', imageUrl: 'assets/taxes.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    String sliderTitle = 'Find your paperwork';

    const double compoWidth = 170.0;
    const double compoHeight = 350.0;
    const double compoMediaHeight = 120.0;
    const double compoInfoHeight = 220.0;

    double wh = MediaQuery.of(context).size.width;
    double hg = compoHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: fixPadding * 1.0, left: fixPadding * 1.0, bottom: 10),
          child: Text(sliderTitle, style: greyHeadingTextStyle),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: fixPadding * 1.0, left: fixPadding * 1.0, bottom: 10),
          child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_circle_right,
                      color: Color(0xff000000), size: 20.0),
                  const SizedBox(width: 10.0),
                  Text('See More', style: smallBoldGreyTextStyle),
                ],
              )),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: fixPadding * 1.0, left: fixPadding * 1.0),
          child: SizedBox(
            width: wh,
            height: hg,
            child: ListView.builder(
              itemCount: lstItems.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                    child: CardHzA(
                  item: lstItems[index],
                  index: index,
                  mediaHeightVal: compoMediaHeight,
                  infoHeightVal: compoInfoHeight,
                  widthVal: compoWidth,
                ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
