import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService() {
    _plugin.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    ));
  }

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> show(String title, String body) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails('alerts', 'Alerts',
          importance: Importance.max, priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    );
    await _plugin.show(0, title, body, details);
  }
}
