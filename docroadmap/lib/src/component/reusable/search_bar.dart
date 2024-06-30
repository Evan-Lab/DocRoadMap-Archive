import 'package:flutter/material.dart';
import 'package:app/src/tools/constant.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      padding: EdgeInsets.all(fixPadding * 1.5),
      margin: EdgeInsets.all(fixPadding * 2.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: greyColor.withOpacity(0.6)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for more',
          hintStyle: greyNormalTextStyle,
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              top: fixPadding * 0.78, bottom: fixPadding * 0.78),
        ),
      ),
    );
  }
}