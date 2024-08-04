// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/config/config.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

//! Más control con local auth
enum LocalAuthStatus { authenticated, notAuthenticated, authenticating }

// Modelo
class LocalAuthState {
  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState(
      {this.didAuthenticate = false,
      this.status = LocalAuthStatus.notAuthenticated,
      this.message = ''});

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) =>
      LocalAuthState(
        didAuthenticate: didAuthenticate ?? this.didAuthenticate,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  String toString() {
    return '''

      didAuthenticate: $didAuthenticate
      status: $status
      message: $message
    ''';
  }
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());

  Future<(bool, String)> authenticateUser({bool biometricOnly = false}) async {
    final (didAuthenticate, message) =
        await LocalAuthPlugin.authenticate(biometricOnly: biometricOnly);

    state = state.copyWith(
        didAuthenticate: didAuthenticate,
        message: message,
        status: didAuthenticate
            ? LocalAuthStatus.authenticated
            : LocalAuthStatus.notAuthenticated);

    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
  return LocalAuthNotifier();
});
