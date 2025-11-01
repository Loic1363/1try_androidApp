import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../functions/page_swiper.dart';
import '../style/custom_header.dart';  
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late String dateString;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    dateString = DateFormat("EEEE d/M/yy", 'fr_FR').format(now);
  }

  void onSettingsPressed() {
    print("Settings pressed");
  }

  void onRefreshPressed() {
    print("Refresh pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              dateString: dateString,
              onButton1Pressed: onSettingsPressed,
              onButton2Pressed: onRefreshPressed,
            ),

            Expanded(
              child: PageSwiper(
                pages: const [
                  Page3(),
                  Page4(),
                  Page5(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
