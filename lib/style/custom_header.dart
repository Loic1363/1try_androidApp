import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String dateString;
  final VoidCallback? onButton1Pressed;
  final VoidCallback? onButton2Pressed;
  final VoidCallback? onCalendarPressed;

  const CustomHeader({
    super.key,
    required this.dateString,
    this.onButton1Pressed,
    this.onButton2Pressed,
    this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bouton calendrier à gauche
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: onCalendarPressed,
            tooltip: 'Select date',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          const Spacer(), // pousse la date vers le centre

          // Date centrée
          Text(
            dateString,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),

          const Spacer(), // pousse les boutons vers la droite

          // Boutons à droite
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: onButton1Pressed,
                tooltip: 'Settings',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: onButton2Pressed,
                tooltip: 'Refresh',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
