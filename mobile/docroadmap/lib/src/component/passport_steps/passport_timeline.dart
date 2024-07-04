import 'package:app/src/page/passport/passport_step_1_page.dart';
import 'package:flutter/material.dart';
import 'package:app/src/component/reusable/timeline.dart';
import 'package:app/src/page/passport/passport_step_2_page.dart';
import 'package:app/src/page/passport/passport_step_3_page.dart';
import 'package:app/src/page/passport/passport_step_4_page.dart';


class VerticalTimelinePassport extends StatefulWidget {
  const VerticalTimelinePassport({Key? key}) : super(key: key);

  @override
  _VerticalTimelinePassportState createState() => _VerticalTimelinePassportState();
}


class _VerticalTimelinePassportState extends State<VerticalTimelinePassport> {
  final GlobalKey<CustomTimelineTileState> _preDemandeKey = GlobalKey();
   final GlobalKey<CustomTimelineTileState> _priseDeRendezVousKey = GlobalKey();
  final GlobalKey<CustomTimelineTileState> _rendezVousKey = GlobalKey();
  final GlobalKey<CustomTimelineTileState> _recupererDocumentKey = GlobalKey();

  void _navigateToPreDemande(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassportFirstStepPage(
        onValidated: () {
          _preDemandeKey.currentState?.updateColor(Colors.green);
        },
      )),
    );
  }

  void _navigateToPriseDeRendezVous(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassportSecondStepPage(
        onValidated: () {
          _priseDeRendezVousKey.currentState?.updateColor(Colors.green);
        },
      )),
    );
  }

  void _navigateToRendezVous(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassportThirdStepPage(
        onValidated: () => {
          _rendezVousKey.currentState?.updateColor(Colors.orange)
        },
      )),
    );
  }

  void _navigateToRecupererDocument(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PassportFourthStepPage(
      )),
    );
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
            key: _preDemandeKey,
            startText: 'Pré-demande de passport',
            endText: 'xx/xx',
            isFirst: true,
            onStartTap: () => _navigateToPreDemande(context),
          ),
          CustomTimelineTile(
            key: _priseDeRendezVousKey,
            startText: 'Prise de rendez-vous en mairie',
            endText: 'xx/xx',
            onStartTap: () => _navigateToPriseDeRendezVous(context),
          ),
          CustomTimelineTile(
            key: _rendezVousKey,
            startText: 'Rendez-vous en mairie',
            endText: 'xx/xx',
            onStartTap: () => _navigateToRendezVous(context),
          ),
          CustomTimelineTile(
            key: _recupererDocumentKey,
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


