import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

void main() {
  //! Se encarga de figar una orientacion del app
  WidgetsFlutterBinding.ensureInitialized();

  //! Llamamos al plugin
  QuickActionsPlugin.registerActions();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //! Inicializamos AwesomeNotifications
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Badge notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color.fromARGB(255, 0, 162, 255),
          ledColor: const Color.fromARGB(255, 255, 0, 0),
          channelShowBadge: true, // Permitir mostrar badge
          importance: NotificationImportance.High,
        )
      ],
      debug: true);

  runApp(const ProviderScope(child: MainApp()));
}

//! Esto nos permite observar la instacion del app
class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  // State<MainApp> createState() => _MainAppState();
  MainAppState createState() => MainAppState();
}

// class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    //Estoy agregando un observador
    WidgetsBinding.instance.addObserver(this);
    ref.read(permissionsProvider.notifier).checkPermissions();
  }

  @override
  void dispose() {
    //Estoy terminando el observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print('State: $state');
    ref.read(appStateProvider.notifier).state = state;
    //Verificamos si otorgamos permmiso fuera de la aplicacion
    if (state == AppLifecycleState.resumed) {
      ref.read(permissionsProvider.notifier).checkPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Hola'),
      //   ),
      //   body: const Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
