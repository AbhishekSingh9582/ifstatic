import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'vedio_play_screen.dart';
import 'bookmark_screen.dart';
import 'account_screen.dart';
import 'package:geolocator/geolocator.dart';

class TabControllers extends StatefulWidget {
  Position position;
  TabControllers(this.position, {super.key});

  @override
  State<TabControllers> createState() => _TabControllersState();
}

class _TabControllersState extends State<TabControllers> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(widget.position),
      VedioPlayScreen(),
      BookMarkScreen(),
      AccountScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 28,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          selectedItemColor: Colors.red,
          unselectedItemColor: Color.fromARGB(255, 255, 188, 188),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ]),
      body: screens[currentIndex],
    );
  }
}
