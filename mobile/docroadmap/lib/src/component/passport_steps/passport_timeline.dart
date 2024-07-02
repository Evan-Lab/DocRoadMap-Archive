import 'package:flutter/material.dart';
import 'package:app/src/component/reusable/timeline.dart';
import 'package:app/src/page/passport/passport_step_1_page.dart';
import 'package:app/src/page/passport/passport_step_2_page.dart';
import 'package:app/src/page/passport/passport_step_3_page.dart';
import 'package:app/src/page/passport/passport_step_4_page.dart';

class VerticalTimelinePassport extends StatelessWidget {
  const VerticalTimelinePassport({super.key});

  void _navigateToPreDemande(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PassportFirstStepPage()));
  }

  void _navigateToPriseDeRendezVous(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PassportSecondStepPage()));
  }

  void _navigateToRendezVous(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PassportThirdStepPage()));
  }

  void _navigateToRecupererDocument(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PassportFourthStepPage()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: ListView(
        children: [
          CustomTimelineTile(
            startText: 'Pré-demande de passport',
            endText: 'xx/xx',
            isFirst: true,
            onStartTap: () => _navigateToPreDemande(context),
          ),
          CustomTimelineTile(
            startText: 'Prise de rendez-vous en mairie',
            endText: 'xx/xx',
            onStartTap: () => _navigateToPriseDeRendezVous(context),
          ),
          CustomTimelineTile(
            startText: 'Rendez-vous en mairie',
            endText: 'xx/xx',
            onStartTap: () => _navigateToRendezVous(context),
          ),
          CustomTimelineTile(
            startText: 'Récupérez votre document',
            endText: 'xx/xx',
            isLast: true,
            onStartTap: () => _navigateToRecupererDocument(context),
          ),
        ],
      ),
    );
  }
}
