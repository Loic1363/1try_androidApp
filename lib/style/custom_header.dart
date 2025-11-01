import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String dateString;
  final VoidCallback? onButton1Pressed;
  final VoidCallback? onButton2Pressed;

  const CustomHeader({
    super.key,
    required this.dateString,
    this.onButton1Pressed,
    this.onButton2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFF1A1A1A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateString,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: onButton1Pressed,
                tooltip: 'Settings',
              ),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: onButton2Pressed,
                tooltip: 'Refresh',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
