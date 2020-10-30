import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/providers/pokemon_list.dart';
import 'package:pokedex/widgets/item.dart';
import 'package:provider/provider.dart';

class ListItems extends StatelessWidget {
  final int gridList;
  const ListItems(this.gridList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        Consumer<PokemonList>(
          builder: (context, model, child) => SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: gridList,
                children: model.items.results
                    .map((item) => ChangeNotifierProvider(
                          create: (_) => Pokemon(),
                          child: Item(item.url),
                        ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}
