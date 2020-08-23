import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_list.dart';
import 'package:pokedex/widgets/list_items.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeDex'),
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
                return ListItems();
            }
          },
        ),
      ),
    );
  }
}
