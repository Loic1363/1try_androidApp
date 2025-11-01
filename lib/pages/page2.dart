import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../functions/date_utils.dart';
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
  late DateTime todayDate;
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    todayDate = DateTime.now();
    currentDate = todayDate;
  }

  Future<void> onCalendarPressed() async {
    DateTime? picked = await selectDate(context, currentDate);
    if (picked != null) {
      setState(() {
        currentDate = picked;
      });
    }
  }

  void onRefreshPressed() {
    setState(() {
      currentDate = todayDate;
    });
  }

  void onSettingsPressed() {
    print("Settings pressed");
  }

  @override
  Widget build(BuildContext context) {
    String dateString = DateFormat("EEE, MMM d").format(currentDate);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              dateString: dateString,
              onCalendarPressed: onCalendarPressed,
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
