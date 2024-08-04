import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

final pokemonItemRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonItemProvider =
    FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonItemRepositoryProvider);
  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;
  
  throw error;
});
