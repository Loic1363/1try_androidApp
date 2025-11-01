import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: const Center(
        child: Text('Page 3', style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
