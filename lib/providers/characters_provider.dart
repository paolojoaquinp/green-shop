import 'dart:convert';
import 'dart:io';
import 'package:green_shop/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class CharactersProvider {
  final String _url = 'https://rickandmortyapi.com/api/character';

  Future<List<CharacterModel>> cargarCharacters() async {
    final url = Uri.parse('$_url');
    final resp = await http.get(url);
  
    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<CharacterModel> productos = [];
    if(decodedData['results'] == null ) return [];
    final data = decodedData['results'];
    print('gola');
    data.forEach((personaje) {
      final prodTemp = CharacterModel.fromJson(personaje);
      productos.add(prodTemp);
    });


    return productos;
  }
}
