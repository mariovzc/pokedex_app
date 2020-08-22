import 'package:flutter/foundation.dart';
import 'package:pokedex/helpers/api.dart';
import 'package:pokedex/models/pokemons.dart';

class PokemonList with ChangeNotifier {
  Pokemons _items;

  Pokemons get items => _items;

  Future<void> setItems() async {
    _items = await API.getAll();
    notifyListeners();
  }
}
