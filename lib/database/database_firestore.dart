import 'package:checkt/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  DBFirestore._();
  static final DBFirestore _instance = DBFirestore._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }

  Future<void> saveUser(Users usuario) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usuarios = firestore.collection('User');

    Map<String, dynamic> userData = {
      'nome': Users.username,
      'email': Users.email,
    };

    await usuarios.add(userData);
  }
}
