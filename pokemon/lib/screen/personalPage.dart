import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/providers/pokemonProvider.dart';

import '../main.dart';

class PersonalPage extends StatelessWidget {
  var c = Get.put(PokemonProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipo'),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: c.equipo.length,
        itemBuilder: (BuildContext context, index) => SizedBox(
          width: 200.0,
          child: ListTile(
            leading: Image.network(
              c.equipo[index].url.toString(),
            ),
            title: Text(
              c.equipo[index].name,
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                wordSpacing: 8,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return_outlined),
        onPressed: () {
          c.equipo.clear();
          Get.back();
        },
      ),
    );
  }
}
