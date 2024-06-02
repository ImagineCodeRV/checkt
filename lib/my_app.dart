import 'package:checkt/pages/homepage.dart';
import 'package:checkt/pages/loginpage.dart';
import 'package:checkt/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (snapshot.hasData) {
            return HomePage();
          }
          return LoginPage();
        },
      ),
    );
  }
}
