import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/badge/badge_screen.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final router = GoRouter(routes: [
  //!General
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/permissions',
    builder: (context, state) => const PermissionsScreen(),
  ),
  //!Sensors
  GoRoute(
    path: '/gyroscope',
    builder: (context, state) => const GyroscopeScreen(),
  ),
  GoRoute(
    path: '/acceloremete',
    builder: (context, state) => const AccelerometerScreen(),
  ),
  GoRoute(
    path: '/magnetometro',
    builder: (context, state) => const MagnetometerScreen(),
  ),
  GoRoute(
    path: '/gyroscope_ball',
    builder: (context, state) => const GyroscopeBallScreen(),
  ),
  GoRoute(
    path: '/compass',
    builder: (context, state) => const CompassScreen(),
  ),
  //!Deep Links
  GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            //Crear una validacion cuando el id no es correcto
            return PokemonItemScreen(pokemonId: id);
          },
        ),
      ]),
  GoRoute(
    path: '/db-pokemons',
    builder: (context, state) => const DbPokemonsScreen(),
  ),
  //! Biometrics
  GoRoute(
    path: '/biometrics',
    builder: (context, state) => const BiometricScreen(),
  ),
  //! Biometrics
  GoRoute(
    path: '/location',
    builder: (context, state) => const LocationScreen(),
  ),
  GoRoute(
    path: '/maps',
    builder: (context, state) => const MapScreen(),
  ),
  GoRoute(
    path: '/controlled-map',
    builder: (context, state) => const ControlledMapScreen(),
  ),
  //! Badge
  GoRoute(
    path: '/badge',
    builder: (context, state) => const BadgeScreen(),
  ),

  // Ads
  GoRoute(
    path: '/ad-fullscreen',
    builder: (context, state) => const AdFullScreen(),
  ),

  GoRoute(
    path: '/ad-rewarded',
    builder: (context, state) => const AdRewardedScreen(),
  ),
]);
