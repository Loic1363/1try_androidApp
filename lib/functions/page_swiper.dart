import 'package:flutter/material.dart';

class PageSwiper extends StatefulWidget {
  final List<Widget> pages;
  final double topButtonRightOffset;

  const PageSwiper({required this.pages, this.topButtonRightOffset = 10, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageSwiperState createState() => _PageSwiperState();
}

class _PageSwiperState extends State<PageSwiper> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: widget.pages,
        ),

        /*
        Positioned(
          top: 20,
          right: widget.topButtonRightOffset,
          child: PopupMenuButton<int>(
            icon: const Icon(Icons.menu, color: Colors.white),
            onSelected: _goToPage,
            itemBuilder: (context) => List.generate(widget.pages.length, (index) {
              return PopupMenuItem<int>(
                value: index,
                child: Text('Page ${index + 2}'),
              );
            }),
          ),
        ),
        */
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pages.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
