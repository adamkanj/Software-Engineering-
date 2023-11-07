import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

Future<void> addUser(String email, String password, String name, String phone) async {
  // Check if user already exists
  DocumentSnapshot snapshot = await usersCollection.doc(email).get();
  if (snapshot.exists) {
    throw Exception('User already exists');
  }
  // Add the user to the database
  return usersCollection
      .doc(email)
      .set({
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<bool> getUser(String email, String password) async {
  // Check if user exists
  QuerySnapshot snapshot = await usersCollection
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .get();
  if (snapshot.size == 0) {
    return false;
  }
  // Return the user data if found
  return true;
}

