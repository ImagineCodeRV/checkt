import 'package:checkt/model/check.dart';
import 'package:checkt/pages/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DBFirestore {
  DBFirestore._();
  static final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }

  void _registerUser(BuildContext context) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usuarios = firestore.collection('Usuarios');
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      usuarios.add({
        'nome': usernameController.text,
        'email': emailController.text,
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print('Error: $e');
    }
  }

  void registerCheck(BuildContext context) async {
    final List<Horarios> _lista = [];
    final checkInController = TextEditingController();
    final checkoutController = TextEditingController();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference horarios = firestore.collection('Usuarios');
    horarios.add([
      {
        'checkIn': checkInController.text,
        'checkOut': checkoutController.text,
      }
    ]);
  }
}
