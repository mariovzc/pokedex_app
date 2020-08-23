import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String pokeUrl;

  const Item(this.pokeUrl, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(child: Text(pokeUrl)),
      color: Colors.green[100],
    );
  }
}
