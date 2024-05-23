import 'package:firebase_database/firebase_database.dart';

class DataBase {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Usuarios');
}
