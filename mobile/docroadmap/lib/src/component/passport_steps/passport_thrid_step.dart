import 'package:flutter/material.dart';

class PassportThirdStep extends StatelessWidget {
  final VoidCallback onValidated;
  const PassportThirdStep({
    super.key,
    required this.onValidated,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Rendez-vous en mairie',
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
        const Divider(color: Colors.white70),
        const Text(
          '• Votre carte d\'identité\n'
          '• Une photo d\'identité de moins de 6 mois\n'
          '• Justificatif de domicile\n'
          '• Votre numéro de pré-demande',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        const Text(
          'Étape à effectuer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(color: Colors.white70),
        const Text(
          '1. Préparez vos documents\n'
          '2. Rendez-vous en mairie avec vos documents',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.help_outline, color: Colors.black),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Vous recevrez un SMS indiquant que votre document est prêt à être récupéré',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.help_outline, color: Colors.black),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'N\'hésitez pas à communiquer la date de disponibilité de votre document',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.warning_amber_outlined, color: Colors.white),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Vous devrez obligatoirement récupérer votre passeport dans la mairie de votre choix',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            onValidated();
            Navigator.pop(context);
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
