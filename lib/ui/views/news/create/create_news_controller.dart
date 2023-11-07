import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/services/navigation_service.dart';

class CreateNewsController {
  BuildContext? context;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  CollectionReference noticias = FirebaseFirestore.instance.collection('noticias');
  final FirebaseAuth _auth = FirebaseAuth.instance;


/* 
  UsersProvider usersProvider = UsersProvider();
  UserPreferences _userPref = UserPreferences(); */

  Future<void>? init(BuildContext context) async {
    this.context = context;
/*     await usersProvider.init(context);

    final rta = await _userPref.read('user');
    if(rta != null) {
      User user = User.fromJson(rta);

      if(user.sessionToken != null) {
        Navigator.pushNamedAndRemoveUntil(context, 'tasks-list', (route) => false);
      }
    } */
  }

  void goToRegisterPage() {
    if(context != null) Navigator.pushNamed(context!, 'register');
  }


  Future<List<QueryDocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot = await noticias.get();
    return querySnapshot.docs;
  }


  Future<void> addNews() {
    // Call the user's CollectionReference to add a new user
    
    String title = titleController.text.trim();
    String description = descController.text.trim(); 
    final user = _auth.currentUser;   
    return noticias
        .add({
          'userId': user?.uid ?? '',
          'title': title,
          'description': description,
          'createdAt': Timestamp.fromDate(DateTime.now()),
        })
        .then((value) {
          print("Noticia añadida");
          locator<NavigationService>().navigateTo('/home');
        } 
        )
        .catchError((error) => print("Failed to add news: $error"));
  }
}