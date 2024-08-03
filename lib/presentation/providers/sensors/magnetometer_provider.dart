import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetometerXYZ {
  final double x;
  final double y;
  final double z;

  MagnetometerXYZ(this.x, this.y, this.z);
  @override
  String toString() {
    return '''
      x:$x,
      y:$y,
      z:$z,
    ''';
  }
}

final magnetometerProvider = StreamProvider.autoDispose<MagnetometerXYZ>((ref) async* {
  // gyroscopeEvents.listen((e){
  //   yield e;
  // });

  // ignore: deprecated_member_use
  await for (final e in magnetometerEvents) {
    final x = double.parse(e.x.toStringAsFixed(2));
    final y = double.parse(e.y.toStringAsFixed(2));
    final z = double.parse(e.z.toStringAsFixed(2));

    yield MagnetometerXYZ(x, y, z);
  }
});
