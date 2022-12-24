import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/modules/pokemon.dart';

import '../providers/pokemonProvider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli

    final PokemonProvider c = Get.put(PokemonProvider());

    print(c.nombrePk);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(),
                _Overview(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Botones(context),
    );
  }

  Padding Botones(BuildContext context) {
    final PokemonProvider c = Get.find();
    final PokemonProvider d = Get.put(PokemonProvider());

    final List<Pokemon> pk = d.pokemons;

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
            child: Icon(Icons.add),
            onPressed: () {
              if (c.equipo.length < 6) {
                c.equipo.add(Pokemon(
                    name: pk[c.numero].name,
                    url:
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${c.numero + 1}.png"));
              } else {
                Get.snackbar(
                  'Atención',
                  'Equipo completo',
                  backgroundColor: Color.fromARGB(98, 231, 231, 226),
                  barBlur: 5,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonProvider c = Get.put(PokemonProvider());

    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            c.nombrePk,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${c.numero + 1}.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final PokemonProvider c = Get.put(PokemonProvider());

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('./assets/loading.gif'),
              image: NetworkImage(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${c.numero + 1}.png",
              ),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            child: Column(
              children: [
                Center(
                  child: Text(
                    c.nombrePk,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text(
                  c.nombrePk,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('si', style: textTheme.caption),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonProvider c = Get.put(PokemonProvider());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            c.nombrePk,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
