// To parse this JSON data, do
//
//     final pokemonResponse = pokemonResponseFromMap(jsonString);

import 'dart:convert';

import 'package:getx/modules/pokemon.dart';

class PokemonResponse {
  PokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int? count;
  String? next;
  dynamic? previous;
  List<Pokemon> results;

  factory PokemonResponse.fromJson(String str) =>
      PokemonResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonResponse.fromMap(Map<String, dynamic> json) => PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Pokemon>.from(json["results"].map((x) => Pokemon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
