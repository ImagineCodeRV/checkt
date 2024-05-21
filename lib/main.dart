import 'package:checkt/model/user.dart';
import 'package:checkt/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:checkt/pages/loginpage.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_Ponto',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KeyboardVisibilityProvider(child: AuthCheck()),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userAvaible = false;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString('Funcionario') != null) {
        setState(() {
          User.username = sharedPreferences.getString('Funcionario')!;
          userAvaible = true;
        });
      }
    } catch (e) {
      setState(() {
        userAvaible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvaible ? const HomePage() : const LoginPage();
  }
}
