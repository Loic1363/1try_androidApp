import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  String getCurrentFormattedDate() {
    final now = DateTime.now();
    // Format : jour complet, jour numéro/mois/année deux chiffres
    return DateFormat("EEEE d/M/yy", 'fr_FR').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final dateString = getCurrentFormattedDate();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateString,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Courier New', // Police monospace souhaitée
                    ),
                  ),
                ],
              ),
            ),
            // Ici rajoute tes autres widgets pour la saisie ou tableau...
          ],
        ),
      ),
    );
  }
}
