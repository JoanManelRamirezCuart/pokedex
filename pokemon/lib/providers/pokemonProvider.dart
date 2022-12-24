import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/modules/pokemonResponse.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../modules/pokemon.dart';

class PokemonProvider extends GetxController {
  var equipo = <Pokemon>[].obs;
  var isLoading = false.obs;
  var pokemonActual = Pokemon(name: "bulbasaur", url: "http1").obs;
  clearTeam() => equipo.clear();

  String _baseUrl = 'pokeapi.co';
  String _offset = '0';
  String _limit = '905';

  var nombrePk = RxString('').toString();

  var numero = 0.obs.toInt();

  var pokemons = <Pokemon>[];

  @override
  Future<void> onInit() async {
    super.onInit();
    getOnPokemonGen();
  }

  getOnPokemonGen() async {
    var url = Uri.https(_baseUrl, 'api/v2/pokemon', {
      'offset': _offset,
      'limit': _limit,
    });

    try {
      isLoading(true);
      http.Response response = await http.get(url);
      final pokeMonsters = PokemonResponse.fromJson(response.body);
      for (int i = 0; i < pokeMonsters.results.length; i++) {
        pokemons.add(pokeMonsters.results[i]);
      }
      print("hola");
    } catch (e) {
      print("Error $e");
    } finally {
      isLoading(false);
    }
  }
}
