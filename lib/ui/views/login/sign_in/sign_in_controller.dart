import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/services/navigation_service.dart';

class SignInController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();    
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        locator<NavigationService>().navigateTo('/home');
      });
        // El usuario ha iniciado sesión con éxito
      } catch (e) {
        // Maneja errores de inicio de sesión
        print("Error de inicio de sesión: $e");
      }
  }
}