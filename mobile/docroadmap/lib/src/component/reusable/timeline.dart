import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatefulWidget {
  final String startText;
  final String endText;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onStartTap;
  final Color initialColor;

  const CustomTimelineTile({
    Key? key,
    required this.startText,
    required this.endText,
    this.isFirst = false,
    this.isLast = false,
    this.onStartTap,
    this.initialColor = Colors.black,
  }) : super(key: key);

  @override
  CustomTimelineTileState createState() => CustomTimelineTileState();
}

class CustomTimelineTileState extends State<CustomTimelineTile> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
  }

  void updateColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onStartTap,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.5,
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: _color,
          padding: const EdgeInsets.all(8),
          iconStyle: IconStyle(
            iconData: Icons.check,
            color: Colors.white,
          ),
        ),
        beforeLineStyle: LineStyle(
          color: _color,
          thickness: 6,
        ),
        afterLineStyle: widget.isLast ? null : LineStyle(
          color: _color,
          thickness: 6,
        ),
        startChild: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Center(
            child: Text(widget.startText),
          ),
        ),
        endChild: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: Center(
            child: Text(widget.endText),
          ),
        ),
      ),
    );
  }
}
