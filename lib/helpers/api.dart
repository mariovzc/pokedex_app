import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/models/pokemons.dart';

class API {
  static const BASEURL = "https://pokeapi.co/api/v2/pokemon";

  static Future<Pokemons> getAll({limit = 50, offset = 300}) async {
    var req = await http.get("$BASEURL?limit=$limit&offset=$offset", headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });

    if (req.statusCode != 200) throw Exception(req.statusCode.toString());

    final res = convert.jsonDecode(req.body);

    return Pokemons.fromJson(res);
  }

  static Future<Pokemon> getItem(String pokeUrl) async {
    final req = await http.get(pokeUrl);

    if (req.statusCode != 200) throw Exception(req.statusCode.toString());

    final res = convert.jsonDecode(req.body);

    return Pokemon.fromJson(res);
  }
}
