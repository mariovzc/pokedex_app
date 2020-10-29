import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/widgets/list_items.dart';
import 'package:pokedex/providers/pokemon_list.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int listOrGrid = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
          "https://img.icons8.com/color/48/000000/pokeball-2.png",
        ),
        title: const Text('PokeDex'),
        actions: [
          IconButton(
              icon: Icon(
                listOrGrid == 1 ? Icons.list : Icons.grid_on,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() => listOrGrid = listOrGrid == 2 ? 1 : 2);
              })
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<PokemonList>(context, listen: false).setItems(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text(snapshot.error.toString()),
              );
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                return ListItems(listOrGrid);
            }
          },
        ),
      ),
    );
  }
}
