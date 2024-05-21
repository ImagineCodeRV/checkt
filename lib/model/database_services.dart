import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Users {
  final String username;
  final String email;

  Users({
    required this.username,
    required this.email,
  });
}

class Record {
  final String checkIn;
  final String checkOut;

  Record({
    required this.checkIn,
    required this.checkOut,
  });
}

class DatabaseServices {
  final _fire = FirebaseFirestore.instance;
  final _rec = FirebaseFirestore.instance;
  createUsers(Users users) {
    try {
      _fire.collection("users").add({
        'name': users.username,
        'email': users.email,
      });
    } catch (e) {}
  }

  createRecord(Record record) {
    try {
      _rec.collection('users').doc().collection('record').add({
        'checkIn': record.checkIn,
        'checkOut': record.checkOut,
      });
    } catch (e) {}
  }
}
