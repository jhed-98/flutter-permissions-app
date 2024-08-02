import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissiosView(),
    );
  }
}

// class _PermissiosView extends StatelessWidget {
class _PermissiosView extends ConsumerWidget {
  const _PermissiosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appState = ref.watch(appStateProvider);
    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Cámara'),
          subtitle: Text('${permissions.camera}'),
          onChanged: (_) {
            //Verificamos si otorgamos permmiso dentro de la aplicacion
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: const Text('Photos Library'),
          subtitle: Text('${permissions.photoLibrary}'),
          onChanged: (_) {
            //Verificamos si otorgamos permmiso dentro de la aplicacion
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Location'),
          subtitle: Text('${permissions.location}'),
          onChanged: (_) {
            //Verificamos si otorgamos permmiso dentro de la aplicacion
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensors'),
          subtitle: Text('${permissions.sensors}'),
          onChanged: (_) {
            //Verificamos si otorgamos permmiso dentro de la aplicacion
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
      ],
    );
  }
}
