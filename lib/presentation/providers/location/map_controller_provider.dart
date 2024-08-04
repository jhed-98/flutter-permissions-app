import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//State
class MapState {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState(
      {this.isReady = false,
      this.followUser = false,
      this.markers = const [],
      this.controller});

  /// Almacena las posiciones marcadas
  Set<Marker> get markersSet {
    return Set.from(markers);
  }

  MapState copyWith({
    bool? isReady,
    bool? followUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) {
    return MapState(
      isReady: isReady ?? this.isReady,
      followUser: followUser ?? this.followUser,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
    );
  }
}

//Notifier
class MapNotifier extends StateNotifier<MapState> {
  /// Ver si esta subcrito su position
  StreamSubscription? userLocation$;

  /// Declaramos las variables de lat y long
  (double, double)? lastKnownLocation;

  /// Modificamos el super con una funcion donde almacenaremos la ultimo posicio
  /// MapNotifier() : super(MapState())
  MapNotifier() : super(MapState()) {
    trackUser().listen((event) {
      lastKnownLocation = (event.$1, event.$2);
    });
  }

  Stream<(double, double)> trackUser() async* {
    await for (final pos in Geolocator.getPositionStream()) {
      yield (pos.latitude, pos.longitude);
    }
  }

  /// Almacena los controllers e iniciar el mapa
  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  /// Animacion de camara en la posicion de usuario
  goToLocation(double latitude, double longitude) {
    final newPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 16,
    );

    // state.controller?.moveCamera(CameraUpdate.newCameraPosition(newPosition));
    state.controller
        ?.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  /// Metodo para seguir al usuario en el mapa
  toggleFollowUser() {
    state = state.copyWith(followUser: !state.followUser);

    if (state.followUser) {
      findUser();
      userLocation$ = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    } else {
      userLocation$?.cancel();
    }
  }

  /// Metodo para obtener la ultima posicion del usuario
  findUser() {
    if (lastKnownLocation == null) return;
    final (latitude, longitude) = lastKnownLocation!;
    goToLocation(latitude, longitude);

    /// Se implemento take para tener solo una animacion
    // trackUser().take(1).listen((event) {
    //   goToLocation(event.$1, event.$2);
    // });
  }

  /// Metodo donde le doy click a btnFlotanate location para guarda la ultima posicion
  void addMarkerCurrentPosition() {
    if (lastKnownLocation == null) return;

    final (latitude, longitude) = lastKnownLocation!;
    addMarker(latitude, longitude, 'Por aquí pasó el usuario');
  }

  /// Metodo donde se alamacena las posiciones en un marcador
  void addMarker(double latitude, double longitude, String name) {
    final newMarker = Marker(
      markerId: MarkerId('${state.markers.length}'),
      position: LatLng(latitude, longitude),
      onTap: () {
        print('onTap en marker');
      },
      infoWindow: InfoWindow(
        title: name,
        snippet: 'Esto es el snippet del info window',
        onTap: () {
          print('Tap en info window');
        },
      ),
    );

    state = state.copyWith(markers: [...state.markers, newMarker]);
  }
}

//Enlazamos los dos metodos
final mapControllerProvider =
    StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  return MapNotifier();
});
