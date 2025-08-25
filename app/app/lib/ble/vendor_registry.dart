import 'package:collection/collection.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import 'mock_profile.dart';
import 'exway_profile.dart';

/// Utility that selects the proper [BoardProfile] based on advertisement data.
class VendorRegistry {
  static final List<BoardProfile> profiles = [
    MockProfile(),
    ExwayProfile(),
  ];

  /// Returns the first profile whose service UUID appears in [adv].
  static BoardProfile? matchByAdvertisement(ScanResult adv) {
    return profiles.firstWhereOrNull(
      (p) => adv.advertisementData.serviceUuids.contains(p.serviceId),
    );
  }
}
