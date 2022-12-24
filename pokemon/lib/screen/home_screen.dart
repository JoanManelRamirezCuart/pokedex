// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';
import 'package:getx/modules/pokemon.dart';
import 'package:getx/providers/pokemonProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'detailsscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonProvider c = Get.put(PokemonProvider());
    final List<Pokemon> pk = c.pokemons;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        elevation: 0,
      ),
      body: Obx(
        () => c.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: pk.length,
                itemBuilder: (BuildContext context, index) => SizedBox(
                    width: 200.0,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png",
                            ),
                            title: Text(pk[index].name.toUpperCase()),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text('Info'),
                                onPressed: () {
                                  c.numero = index;
                                  c.nombrePk = pk[index].name.toUpperCase();
                                  Get.toNamed('detalles');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Botones(context),
    );
  }

  Padding Botones(BuildContext context) {
    final PokemonProvider c = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'Personaaal',
            child: Icon(
              Icons.catching_pokemon_sharp,
              color: Color.fromARGB(190, 207, 207, 207),
            ),
            backgroundColor: Colors.black87,
            onPressed: () {
              Get.toNamed('personal');
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () => c.clearTeam(),
          ),
        ],
      ),
    );
  }
}
