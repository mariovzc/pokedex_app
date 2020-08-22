import 'package:flutter/material.dart';
import 'package:pokedex/widgets/list_items.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeDex'),
      ),
      body: ListItems(),
    );
  }
}
