import 'dart:async';
import 'package:checkt/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  Color bgColor = Colors.white;
  Color primary = const Color.fromARGB(253, 17, 32, 167);
  double screenHeight = 0;
  double screenWidth = 0;

  String checkIn = '--/--';
  String checkOut = '--/--';

  @override
  void initState() {
    super.initState();
    _getGravar();
  }

  void _getGravar() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('Usuario')
          .where('id', isEqualTo: User.username)
          .get();

      DocumentSnapshot snapdoc = await FirebaseFirestore.instance
          .collection("Usuario")
          .doc(snap.docs[0].id)
          .collection("Record")
          .doc(DateFormat('dd/MM/yyyy').format(DateTime.now()))
          .get();

      setState(() {
        checkIn = snapdoc['checkIn'];
        checkOut = snapdoc['checkOut'];
      });
    } catch (e) {
      checkIn = '--/--';
      checkOut = '--/--';
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                'Usuario ${User.username}',
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                'Status',
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
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
              margin: const EdgeInsets.only(top: 32),
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
            checkOut == '--/--'
                ? Container(
                    margin: const EdgeInsets.only(top: 36),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> key = GlobalKey();
                        return SlideAction(
                          text: checkIn == '--/--'
                              ? 'Deslize para CheckIn'
                              : 'Deslize para CheckOut',
                          textStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: screenWidth / 22,
                          ),
                          outerColor: Colors.white,
                          innerColor: primary,
                          key: key,
                          onSubmit: () async {
                            Timer(const Duration(seconds: 1), () {
                              key.currentState!.reset();
                            });
                            QuerySnapshot snap = await FirebaseFirestore.instance
                                .collection('Usuarios')
                                .where('id', isEqualTo: User.username)
                                .get();

                            DocumentSnapshot snapdoc = await FirebaseFirestore
                               .instance
                                .collection("Usuarios")
                                .doc(snap.docs[0].id)
                                .collection("Gravar")
                                .doc(DateFormat('dd/MM/yyyy').format(DateTime.now()))
                                .get();

                            try {
                              String checkIn = snapdoc['checkIn'];
                            setState(() {
                              checkOut =
                                  DateFormat('hh:mm').format(DateTime.now());
                            });
                              await FirebaseFirestore.instance
                                  .collection("Usuarios")
                                  .doc(snap.docs[0].id)
                                  .collection("Gravar")
                                  .doc(
                                      DateFormat('dd/MM/yyyy').format(DateTime.now()))
                                  .update({
                                'checkIn': checkIn,
                                'checkOut': DateFormat('hh:mm').format(DateTime.now()),
                              });
                            } catch (e) {
                            setState(() {
                              checkIn =
                                  DateFormat('hh:mm').format(DateTime.now());
                            });
                              await FirebaseFirestore.instance
                                  .collection("Usuarios")
                                  .doc(snap.docs[0].id)
                                  .collection("Gravar")
                                  .doc(
                                      DateFormat('dd/MM/yyyy').format(DateTime.now()))
                                  .set({
                                'checkIn': DateFormat('hh:mm').format(DateTime.now()),
                              });
                            }
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      "Já fez seu checkout hoje!!",
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
