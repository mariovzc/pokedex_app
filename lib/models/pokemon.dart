import 'dart:convert';

import 'package:flutter/foundation.dart';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  Pokemon(
      {@required this.id,
      @required this.name,
      @required this.types,
      @required this.defaultSprite,
      @required this.shinnySprite});

  int id;
  String name;
  List<String> types = [];
  String defaultSprite;
  String shinnySprite;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'],
      name: json['name'],
      types: _typesBuilder(json["types"]),
      shinnySprite: _spriteBuilder(json, "front_default"),
      defaultSprite: _spriteBuilder(json, "front_shiny"));

  static String _spriteBuilder(json, key) =>
      json["sprites"][key] == null ? "" : json["sprites"][key];

  static List _typesBuilder(List types) => types.map((e) => e["type"]["name"]);
}
