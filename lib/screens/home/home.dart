import 'package:flutter/material.dart';
import 'package:lista_de_pokemon/models/pokemon.dart';
import 'package:lista_de_pokemon/provider/pokemons.dart';
import 'package:lista_de_pokemon/screens/details/details.dart';
import 'package:lista_de_pokemon/screens/details/widgets/pill.dart';
import 'package:lista_de_pokemon/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
        backgroundColor: redTheme,
      ),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: listOfPokemons.length,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    Pokemon _pokemon = listOfPokemons.elementAt(index);
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  _pokemon.photo,
                  width: 60,
                  height: 60,
                  // fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _pokemon.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            _pokemon.descripition,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Details(_pokemon),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
