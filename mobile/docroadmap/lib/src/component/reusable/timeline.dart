import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:app/src/page/passport/passport_step_1_page.dart';
import 'package:app/src/page/passport/passport_step_2_page.dart';
import 'package:app/src/page/passport/passport_step_3_page.dart';
import 'package:app/src/page/passport/passport_step_4_page.dart';

class CustomTimelineTile extends StatelessWidget {
  final String startText;
  final String endText;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onStartTap;

  const CustomTimelineTile({
    Key? key,
    required this.startText,
    required this.endText,
    this.isFirst = false,
    this.isLast = false,
    this.onStartTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStartTap,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.5,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: Colors.black,
          padding: const EdgeInsets.all(8),
          iconStyle: IconStyle(
            iconData: Icons.check,
            color: Colors.white,
          ),
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.black,
          thickness: 6,
        ),
        afterLineStyle: isLast ? null : const LineStyle(
          color: Colors.black,
          thickness: 6,
        ),
        startChild: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Center(
            child: Text(startText),
          ),
        ),
        endChild: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Center(
            child: Text(endText),
          ),
        ),
      ),
    );
  }
}
