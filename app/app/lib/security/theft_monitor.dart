import 'notifications.dart';

/// Monitors for background theft pings when the board is locked.
class TheftMonitor {
  TheftMonitor(this._notifications);

  final NotificationService _notifications;
  bool _locked = false;

  void setLocked(bool locked) {
    _locked = locked;
  }

  /// Simulate a background advert ping.
  void simulatePing() {
    if (_locked) {
      _notifications.show('Board Alert',
          'Motion detected while board is locked');
    }
  }
}
