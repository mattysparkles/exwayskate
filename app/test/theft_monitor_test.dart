import 'package:flutter_test/flutter_test.dart';
import 'package:xray_companion/security/theft_monitor.dart';
import 'package:xray_companion/security/notifications.dart';

class _TestNotif extends NotificationService {
  int count = 0;
  @override
  Future<void> show(String title, String body) async {
    count++;
  }
}

void main() {
  test('Theft monitor triggers when locked', () {
    final notif = _TestNotif();
    final monitor = TheftMonitor(notif);
    monitor.setLocked(true);
    monitor.simulatePing();
    expect(notif.count, 1);
  });
}
