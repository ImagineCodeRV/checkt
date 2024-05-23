import 'package:checkt/model/user.dart';
import 'package:checkt/pages/calendarpage.dart';
import 'package:checkt/pages/profilepage.dart';
import 'package:checkt/pages/todaypage.dart';
import 'package:checkt/services/auth_service.dart';
import 'package:checkt/widget/bottomnavigatorbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  late FirebaseFirestore db;
  late AuthService auth;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color.fromARGB(253, 17, 32, 167);
  int currentIndex = 0;
  String id = '';

  List<IconData> navigationIcons = [
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.user,
  ];

  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("Usuarios")
        .where("id", isEqualTo: Users.username)
        .get();

    setState(() {
      Users.username = snap.docs[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CalendarPage(),
          TodayPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: const BottomNavigatorBarWidget(),
    );
  }
}
