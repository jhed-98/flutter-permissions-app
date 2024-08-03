import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerXYZ {
  final double x;
  final double y;
  final double z;

  AccelerometerXYZ(this.x, this.y, this.z);
  @override
  String toString() {
    return '''
      x:$x,
      y:$y,
      z:$z,
    ''';
  }
}

final accelerometerGravityProvider = StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  // gyroscopeEvents.listen((e){
  //   yield e;
  // });

  // ignore: deprecated_member_use
  await for (final e in accelerometerEvents) {
    final x = double.parse(e.x.toStringAsFixed(3));
    final y = double.parse(e.y.toStringAsFixed(3));
    final z = double.parse(e.z.toStringAsFixed(3));

    yield AccelerometerXYZ(x, y, z);
  }
});

final accelerometerUserProvider = StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  // gyroscopeEvents.listen((e){
  //   yield e;
  // });

  // ignore: deprecated_member_use
  await for (final e in userAccelerometerEvents) {
    final x = double.parse(e.x.toStringAsFixed(2));
    final y = double.parse(e.y.toStringAsFixed(2));
    final z = double.parse(e.z.toStringAsFixed(2));

    yield AccelerometerXYZ(x, y, z);
  }
});

