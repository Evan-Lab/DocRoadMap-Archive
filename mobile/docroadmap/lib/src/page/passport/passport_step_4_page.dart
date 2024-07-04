import 'package:app/src/component/passport_steps/passport_four_step.dart';
import 'package:flutter/material.dart';

class PassportFourthStepPage extends StatelessWidget {
  const PassportFourthStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Première demande de passeport',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: const PassportFourthStep(),
      ),
    );
  }
}