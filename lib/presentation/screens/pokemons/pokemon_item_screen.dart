import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonItemScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonItemScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonItemProvider(pokemonId));
    // return Scaffold(
    //   body: Center(child: Text('Pokemon: $pokemonId'),),
    // );
    return pokemonAsync.when(
      data: (pokemon) => _PokemonItemView(pokemon: pokemon),
      error: (error, stackTrace) => _ErrorMessage(message: error.toString()),
      loading: () => const _LoadingWidget(),
    );
  }
}

class _PokemonItemView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonItemView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        actions: [
          IconButton(
            onPressed: () {
              //! Link = DeepLink
              SharePlugin.shareLink(pokemon.sprinFront, 'Mira este pókemon');
            },
            icon: const Icon(Icons.share_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemon.sprinFront,
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 8), // Espacio entre la imagen y el texto
            Text(
              'Tipo: ${pokemon.type}', // Reemplaza con el nombre del Pokémon
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
