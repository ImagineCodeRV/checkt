import 'package:checkt/widget/auth_check.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    home: AuthCheck(),
    );
  }
}