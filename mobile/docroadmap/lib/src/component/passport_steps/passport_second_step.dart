import 'package:app/src/component/passport_steps/passport_timeline.dart';
import 'package:app/src/page/passport/passport_step_3_page.dart';
import 'package:flutter/material.dart';

class PassportSecondStep extends StatelessWidget {
  const PassportSecondStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Prise de rendez-vous en mairie',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Document à fournir',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Aucun document à fournir',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Choix possibles',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '1. Contactez votre mairie',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        const Text(
          '2. Rendez-vous sur ce site pour localiser et prendre rendez-vous en mairie',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        const InkWell(
          child: Text(
            'https://passeport.ants.gouv.fr/services/geolocaliser-une-mairie-habilitee',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Vous pouvez choisir n\'importe quelle mairie en France',
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Vous devrez obligatoirement récupérer votre passeport dans la mairie de votre choix',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Avez-vous une date de rendez-vous ?',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: '01/07/2024',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const VerticalTimelinePassport(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Valider l\'étape',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
