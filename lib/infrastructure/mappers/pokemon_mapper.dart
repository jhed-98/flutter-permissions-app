import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/infrastructure/models/api_pokemon_resp.dart';

class PokemonMapper {
  static Pokemon apiPokemonToEntity(Map<String, dynamic> json) {
    final apiPokemon = ApiPokemonResp.fromJson(json);

    return Pokemon(
        id: apiPokemon.id,
        name: apiPokemon.name,
        sprinFront: apiPokemon.sprites.frontDefault,
        type: apiPokemon.types[0].type.name);
  }
}
