import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context, listen: false);
    return GestureDetector(
      onTap: () => pokemon.changeDisplay(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
          Consumer<Pokemon>(
            builder: (_, model, __) => Align(
              alignment: Alignment.center,
              child: Container(
                child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                          value: progress.progress,
                        ),
                    imageUrl: model.displayDefault
                        ? pokemon.defaultSprite
                        : pokemon.shinnySprite),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Text(
                pokemon.name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
