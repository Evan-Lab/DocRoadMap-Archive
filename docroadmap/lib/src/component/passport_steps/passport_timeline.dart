import 'package:app/src/component/reusable/timeline.dart';
import 'package:flutter/material.dart';

class VerticalTimelinePassport extends StatelessWidget {
  const VerticalTimelinePassport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: ListView(
        children: const [
          CustomTimelineTile(
            startText: 'Pré-demande de passport',
            endText: 'xx/xx',
            isFirst: true,
          ),
          CustomTimelineTile(
            startText: 'Prise de rendez-vous en mairie',
            endText: 'xx/xx',
          ),
          CustomTimelineTile(
            startText: 'Rendez-vous en mairie',
            endText: 'xx/xx',
          ),
          CustomTimelineTile(
            startText: 'Récupérez votre document',
            endText: 'xx/xx',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

