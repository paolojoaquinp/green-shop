import 'package:flutter/material.dart';
import 'package:green_shop/models/character_model.dart';
import 'package:green_shop/providers/characters_provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final characProvider = new CharactersProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FutureBuilder(
          future: characProvider.cargarCharacters(),
          builder: (context, snapshot) {
            final data = snapshot.data as dynamic;
            if(snapshot.hasData) {
              return GridView.builder(            
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _CharacterItem(el: data[index]);
                },
              );
            }else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({
    Key? key,
    required this.el,
  }) : super(key: key);

  final CharacterModel el;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Expanded(
            child: Image(image: NetworkImage(el.image as String))
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              el.name as String,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ]
      ),
    );
  }
}