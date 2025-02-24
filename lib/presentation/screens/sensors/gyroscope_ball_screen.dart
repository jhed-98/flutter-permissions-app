import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscópio'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
            data: (value) => MovingBall(x: value.x, y: value.y),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeigth = size.height;

    double currentYPos = (y * 150);
    double currentXPos = (x * 150);
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            left: (currentYPos - 25) + (screenWidth / 2),
            top: (currentXPos - 25) + (screenHeigth / 2),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            child: const Ball()),
        Text(
          '''
          X:$x,
          Y:$y
          ''',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue[400], borderRadius: BorderRadius.circular(100)),
    );
  }
}
