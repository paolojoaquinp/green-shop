import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_shop/firebase_options.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/router/router.dart';
import 'package:green_shop/services/navigation_service.dart';
import 'package:green_shop/ui/layout/main_layout_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web
  );
  FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
  ]);

  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter app',
      initialRoute: '/home',
      theme: ThemeData(
        useMaterial3: true
      ),
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: ( _, child ) {
        return MainLayoutPage(
          child: child ?? Container(child: Text('Hola'),),
        );
      },
    );
  }
}