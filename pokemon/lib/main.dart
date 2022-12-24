import 'package:flutter/material.dart';
import 'package:getx/modules/pokemon.dart';
import 'package:getx/providers/pokemonProvider.dart';
import 'package:getx/screen/detailsscreen.dart';
import 'package:getx/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'modules/pokemon.dart';
import 'screen/personalPage.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'personal': (context) => PersonalPage(),
        'detalles': (context) => DetailsScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
