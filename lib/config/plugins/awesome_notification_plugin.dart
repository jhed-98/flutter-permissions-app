import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class AwesomeNotificationPlugin {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Badge notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color.fromARGB(255, 0, 162, 255),
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        channelShowBadge: true, // Permitir mostrar badge
        importance: NotificationImportance.High,
      )
    ]);
  }

  static Future<bool> get isNotificationAllowed async {
    return await AwesomeNotifications().isNotificationAllowed();
  }

  static void updateNotification(int count) async {
    if (!await isNotificationAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
      return;
    }
    print('Contador: $count');
    // AwesomeNotifications().setGlobalBadgeCounter(count);
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: count, // Usar un ID único para evitar duplicados
            channelKey: 'basic_channel',
            title: 'New msj',
            body: 'Flutter dev',
            badge: count, // Establecer el contador del badge
            notificationLayout: NotificationLayout.Default));

    if (count == 0) removeNotificacion();
  }

  static void removeNotificacion() async {
    if (!await isNotificationAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
      return;
    }

    AwesomeNotifications().resetGlobalBadge();
  }
}
