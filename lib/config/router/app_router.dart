import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final router = GoRouter(routes: [
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
]);
