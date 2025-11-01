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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF4DA),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Color(0xFF0D0D0D)),
              onPressed: onCalendarPressed,
              tooltip: 'Select date',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const Spacer(),
            Text(
              dateString,
              style: const TextStyle(color: Color(0xFF0D0D0D), fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Color(0xFF0D0D0D)),
                  onPressed: onButton1Pressed,
                  tooltip: 'Settings',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Color(0xFF0D0D0D)),
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
      ),
    );
  }
}
