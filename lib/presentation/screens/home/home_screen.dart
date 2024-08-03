import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Miselaenos'),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           context.push('/permissions');
      //         },
      //         icon: const Icon(Icons.settings))
      //   ],
      // ),
      //Para usar SliverGrid se usa un scroll personalizado
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Miselaenos'),
              actions: [
                IconButton(
                    onPressed: () {
                      context.push('/permissions');
                    },
                    icon: const Icon(Icons.settings))
              ],
            ),
            const MainMenu(),
          ],
        ),
      ),
    );
  }
}
