import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokedex/helpers/api.dart';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon with ChangeNotifier {
  Pokemon(
      {this.id, this.name, this.types, this.defaultSprite, this.shinnySprite});

  int id;
  String name;
  List<String> types = [];
  String defaultSprite;
  String shinnySprite;
  bool displayDefault = true;

  void changeDisplay() {
    displayDefault = !displayDefault;
    notifyListeners();
  }

  Future<void> setItem(url) async {
    final res = await API.getItem(url);
    id = res.id;
    name = res.name;
    types = res.types;
    defaultSprite = res.defaultSprite;
    shinnySprite = res.shinnySprite;
    displayDefault = res.displayDefault;

    notifyListeners();
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'],
      name: json['name'],
      types: _typesBuilder(json["types"]),
      shinnySprite: _spriteBuilder(json, "front_default"),
      defaultSprite: _spriteBuilder(json, "front_shiny"));

  static String _spriteBuilder(json, key) =>
      json["sprites"][key] == null ? "" : json["sprites"][key];

  static List _typesBuilder(List types) =>
      types.map((item) => item["type"]["name"].toString()).toList();
}
