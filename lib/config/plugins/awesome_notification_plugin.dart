import 'package:awesome_notifications/awesome_notifications.dart';

class AwesomeNotificationPlugin {
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
            title: 'test',
            body: 'test',
            badge: count, // Establecer el contador del badge
            notificationLayout: NotificationLayout.Inbox));

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
