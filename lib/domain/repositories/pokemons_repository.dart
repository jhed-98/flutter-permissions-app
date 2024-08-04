import 'package:miscelaneos/domain/domain.dart';

//!Implementar los metodos y aceptar los datasource
abstract class PokemonsRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}
