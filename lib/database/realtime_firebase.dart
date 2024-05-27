import 'package:checkt/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBase {
  String userIdReference =
      FirebaseDatabase.instance.ref().child('Usuarios').push().key!;
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Usuarios');
}
