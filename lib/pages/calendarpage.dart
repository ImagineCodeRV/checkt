import 'package:checkt/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Color bgColor = Colors.white;
  Color primary = const Color.fromARGB(253, 17, 32, 167);
  double screenHeight = 0;
  double screenWidth = 0;

  String checkIn = '--/--';
  String checkOut = '--/--';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 32),
            child: Text(
              'Meu ponto',
              style: TextStyle(
                fontSize: screenWidth / 20,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 32),
                child: Text(
                  DateFormat('MMMM').format(
                    DateTime.now(),
                  ),
                  style: TextStyle(
                    fontSize: screenWidth / 20,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 32),
                child: Text(
                  'Escolha o Mês',
                  style: TextStyle(
                    fontSize: screenWidth / 20,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: screenHeight - screenHeight / 5,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Usuario")
                  .doc(User.id)
                  .collection("Record")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 12),
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check In',
                                    style: TextStyle(
                                      fontSize: screenWidth / 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    snap[index]['checkIn'],
                                    style: TextStyle(
                                      fontSize: screenWidth / 18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check Out',
                                    style: TextStyle(
                                      fontSize: screenWidth / 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    snap[index]['checkOut'],
                                    style: TextStyle(
                                      fontSize: screenWidth / 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
