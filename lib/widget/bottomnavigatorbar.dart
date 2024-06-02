import 'package:checkt/pages/calendarpage.dart';
import 'package:checkt/pages/chat.dart';
import 'package:checkt/pages/profilepage.dart';
import 'package:checkt/pages/todaypage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  const BottomNavigatorBarWidget({super.key});

  @override
  State<BottomNavigatorBarWidget> createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
  int _indiceAtual = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> navigationItems = [
      const Icon(Icons.calendar_today),
      const Icon(Icons.check),
      const Icon(Icons.person),
      const Icon(Icons.chat),
    ];

    List<Widget> pages = [
      const CalendarPage(),
      const TodayPage(),
      const ProfilePage(),
      const ChatPage(),
    ];

    Color bgColor = Colors.black54;
    return Scaffold(
      body: pages[_indiceAtual],
      bottomNavigationBar: CurvedNavigationBar(
        items: navigationItems,
        height: 75,
        index: _indiceAtual,
        buttonBackgroundColor: Colors.yellow[700],
        backgroundColor: bgColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
      ),
    );
  }
}
