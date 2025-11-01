import 'package:flutter/material.dart';
import '../functions/page_swiper.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: PageSwiper(
        pages: [
          const Page3(),
          const Page4(),
          const Page5(),
        ],
      ),
    );
  }
}
