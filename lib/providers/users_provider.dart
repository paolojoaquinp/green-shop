

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
   String uid,
   String username,
   String email,
   DateTime createdAt,
  ) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'uid': uid,
          'username': username,
          'email': email,
          'createdAt': Timestamp.fromDate(createdAt),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

}