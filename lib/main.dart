import 'package:flutter/material.dart';
import 'package:green_shop/router/route_generator.dart';
import 'package:green_shop/ui/layout/main_layout_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green shop',
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: ( _, child ) {
        return MainLayoutPage(
          child: child ?? Container(),
        );
      },
    );
  }
}