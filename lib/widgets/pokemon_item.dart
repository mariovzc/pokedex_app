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
    switch (type) {
      case "fairy":
        return Colors.blueGrey[50];
        break;
      case "dark":
        return Colors.blueGrey[800];
        break;
      case "dragon":
        return Colors.deepPurple[400];
        break;
      case "steel":
        return Colors.grey;
        break;
      case "ghost":
        return Colors.purple[300];
        break;
      case "bug":
        return Colors.green[200];
        break;
      case "ice":
        return Colors.blue[200];
        break;
      case "psychic":
        return Colors.purple[700];
        break;
      case "rock":
        return Colors.yellow[800];
        break;
      case "ground":
        return Colors.brown[400];
        break;
      case "electric":
        return Colors.yellow[400];
        break;
      case "poison":
        return Colors.purple[800];
        break;
      case "fighting":
        return Colors.deepOrange[400];
        break;
      case "flying":
        return Colors.deepPurple[400];
        break;
      case "grass":
        return Colors.green;
        break;
      case "water":
        return Colors.blue[900];
        break;
      case "fire":
        return Colors.red[900];
        break;
      case "normal":
        return Colors.pink[200];
        break;
      default:
        return Colors.black87;
        break;
    }
  }
}
