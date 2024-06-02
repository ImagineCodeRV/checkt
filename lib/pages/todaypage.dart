import 'dart:async';
import 'dart:core';
import 'package:checkt/database/realtime_firebase.dart';
import 'package:checkt/model/user.dart';
import 'package:checkt/pages/loginpage.dart';
import 'package:checkt/services/auth_service.dart';
import 'package:checkt/widget/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Color bgColor = Colors.white;
  Color primary = const Color.fromARGB(252, 167, 165, 17);
  double screenHeight = 0;
  double screenWidth = 0;

  var checkIn = '--/--';
  var checkOut = '--/--';

  @override
  void initState() {
    super.initState();
    _getGravar();
  }

  /*void _getGravar() async {
    final DatabaseReference ref = DataBase()
        .reference
        .child(Users.username)
        .child(DateTime.now().microsecond.toString());
    //checkIn = Timestamp.now().toDate() as TextEditingController;
    //checkOut = Timestamp.now().toDate() as TextEditingController;
    await ref.set({
      'nome': Users.username,
      'checkIn': 'checkIn',
      'checkOut': 'checkOut',
    });
  }*/

  void _getGravar() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('Usuarios')
          .where('name', isEqualTo: Users.username)
          .get();

      DocumentSnapshot snapdoc = await FirebaseFirestore.instance
          .collection("Usuarios")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd/MM/yyyy').format(DateTime.now()))
          .get();

      setState(() {
        checkIn = snapdoc['checkIn'];
        checkOut = snapdoc['checkOut'];
      });
    } catch (e) {
      setState(() {
        checkIn = '--/--';
        checkOut = '--/--';
      });
    }

    print(checkIn);
    print(checkOut);
  }

  logout() async {
    await _auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                'Bem Vindo',
                style: TextStyle(
                  fontSize: screenWidth / 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                Users.id,
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                'Today Status',
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 32),
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
                          checkIn,
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
                          checkOut,
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
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 20,
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat('/MM/yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('hh:mm:ss a').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                        color: Colors.black54,
                      ),
                    ),
                  );
                }),
            Container(
              margin: const EdgeInsets.only(top: 36, bottom: 12),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  return SlideAction(
                    text: 'Deslize para CheckIn',
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 22,
                    ),
                    outerColor: bgColor,
                    innerColor: primary,
                    key: key,
                    onSubmit: () async {
                      Timer(const Duration(seconds: 1), () {});
                      QuerySnapshot snap = await FirebaseFirestore.instance
                          .collection('Usuario')
                          .where('nome', isEqualTo: Users.username)
                          .get();

                      DocumentSnapshot snapdoc = await FirebaseFirestore
                          .instance
                          .collection("Usuario")
                          .doc('Check')
                          .collection("Record")
                          .doc(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                          .get();

                      try {
                        String checkIn = snapdoc['checkIn'];
                        setState(() {
                          checkOut = DateFormat('hh:mm').format(DateTime.now());
                        });
                        await FirebaseFirestore.instance
                            .collection("Usuarios")
                            .doc()
                            .collection("Record")
                            .doc(
                                DateFormat('dd/MM/yyyy').format(DateTime.now()))
                            .update({
                          'checkIn': checkIn,
                          'checkOut':
                              DateFormat('hh:mm').format(DateTime.now()),
                        });
                      } catch (e) {
                        setState(() {
                          checkIn = DateFormat('hh:mm').format(DateTime.now());
                        });
                        await FirebaseFirestore.instance
                            .collection("Usuarios")
                            .doc(snap.docs[0].id)
                            .collection("Gravar")
                            .doc(
                                DateFormat('dd/MM/yyyy').format(DateTime.now()))
                            .set({
                          'checkIn': DateFormat('hh:mm').format(DateTime.now()),
                          'checkOut': "--/--",
                        });
                      }
                      key.currentState!.reset();
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                "Já fez seu checkout hoje!!",
                style: TextStyle(
                  fontSize: screenWidth / 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: logout, child: const Text("LogOut")),
            )
          ],
        ),
      ),
    );
  }
}
