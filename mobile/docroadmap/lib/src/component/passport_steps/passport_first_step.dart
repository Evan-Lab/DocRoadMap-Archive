import 'package:app/src/component/passport_steps/passport_second_step.dart';
import 'package:app/src/component/passport_steps/passport_timeline.dart';
import 'package:flutter/material.dart';

class PassportFirstStep extends StatelessWidget {
  const PassportFirstStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Pré-demande de passeport',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Document à fournir',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Aucun document à fournir',
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 16),
        const Text(
          'Etapes à effectuer',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '1. Rendez-vous sur ce site et suivez les étapes pour acheter votre timbre fiscal électronique.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 4),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: InkWell(
            child: Text(
              'https://timbres.impots.gouv.fr/',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  decoration: TextDecoration.underline),
              //onTap: () => launch('https://passeport.ants.gouv.fr/services/geolocaliser-une-mairie-habilitee'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '2. Rendez-vous sur ce site pour Préremplire votre demande.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          '3. Gardez votre numéro de demande !',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 64),
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