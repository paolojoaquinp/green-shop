import 'package:flutter/material.dart';

class CharacterView extends StatelessWidget {
  final String idC;
  const CharacterView(this.idC);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Personaje'),
      ),
    );
  }
}