import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/widgets/pokemon_item.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  final String pokeUrl;

  const Item(this.pokeUrl, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Pokemon>(context, listen: false).setItem(pokeUrl),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: CircularProgressIndicator()),
                color: Colors.grey[600],
              );
              break;
            default:
              return PokemonItem();
          }
        });
  }
}
