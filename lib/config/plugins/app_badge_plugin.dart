import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';

//! Obsoleta
class AppBadgePlugin {
  static Future<bool> get isBadgeSupported {
    return FlutterAppBadgeControl.isAppBadgeSupported();
  }

  static void updateBadgeCount(int count) async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }

    FlutterAppBadgeControl.updateBadgeCount(count);

    if (count == 0) removeBadge();
  }

  static void removeBadge() async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }

    FlutterAppBadgeControl.removeBadge();
  }
}
