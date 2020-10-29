import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/helpers/string_formatters.dart';
import 'package:pokedex/providers/pokemon.dart';
import 'package:pokedex/widgets/double_color_bg.dart';
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
          DoubleColorBg(
            colors: _colorBuilder(pokemon.types),
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
                StringFormatter.capitalize(pokemon.name),
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

  List<Color> _colorBuilder(List<String> types) {
    return types.map((t) => _getColorByType(t)).toList();
  }

  Color _getColorByType(type) {
    Map colors = {
      "fairy": Colors.blueGrey[50],
      "dark": Colors.blueGrey[800],
      "dragon": Colors.deepPurple[400],
      "steel": Colors.grey,
      "ghost": Colors.purple[300],
      "bug": Colors.green[200],
      "ice": Colors.blue[200],
      "psychic": Colors.purple[700],
      "rock": Colors.yellow[800],
      "ground": Colors.brown[400],
      "electric": Colors.yellow[400],
      "poison": Colors.purple[800],
      "fighting": Colors.deepOrange[400],
      "flying": Colors.deepPurple[400],
      "grass": Colors.green,
      "water": Colors.blue[900],
      "fire": Colors.red[900],
      "normal": Colors.pink[200]
    };

    if (colors[type] == null){
      return Colors.black87;
    }
    return colors[type];
  }
}
