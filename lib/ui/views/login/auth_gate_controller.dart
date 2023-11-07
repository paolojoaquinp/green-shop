import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_shop/providers/users_provider.dart';


class AuthGateController {

  BuildContext? context;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void>? init(BuildContext context){
    this.context = context;
  }

  void register({
    required String uid,
    required String username,
    required String email,
  }) async {
    final userProvider = UserProvider();
    final date = DateTime.now();
    await userProvider.addUser(uid, username, email, date);
    print('usuario creado');

  }
}