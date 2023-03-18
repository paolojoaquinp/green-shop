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

    final List<CharacterModel> personajes = [];
    if(decodedData['results'] == null ) return [];
    final data = decodedData['results'];
    data.forEach((personaje) {
      final prodTemp = CharacterModel.fromJson(personaje);
      personajes.add(prodTemp);
    });


    return personajes;
  }


  Future<CharacterModel?> cargarPersonajeId(id) async {
    final url = Uri.parse('$_url/${id.toString()}');
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    return CharacterModel.fromJson(decodedData);
  }
}
