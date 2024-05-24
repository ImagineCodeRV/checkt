import 'package:checkt/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBase {
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Usuarios').push().child(Users.username);
}
