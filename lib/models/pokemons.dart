// To parse this JSON data, do
//
//     final pokemons = pokemonsFromJson(jsonString);

import 'dart:convert';

Pokemons pokemonsFromJson(String str) => Pokemons.fromJson(json.decode(str));

String pokemonsToJson(Pokemons data) => json.encode(data.toJson());

class Pokemons {
  Pokemons({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count = 0;
  String next;
  String previous;
  List<Result> results = [];

  factory Pokemons.fromJson(Map<String, dynamic> json) => Pokemons(
        count: json["count"],
        next: json["next"] == null ? null : json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next == null ? null : next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
