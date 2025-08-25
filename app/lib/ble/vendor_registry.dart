import 'package:collection/collection.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'board_profile.dart';
import 'mock_profile.dart';
import 'exway_profile.dart';

class VendorRegistry {
  static final List<BoardProfile> profiles = [
    MockProfile(),
    ExwayProfile(),
  ];

  static BoardProfile? matchByAdvertisement(ScanResult adv) {
    return profiles.firstWhereOrNull(
      (p) => adv.advertisementData.serviceUuids.contains(p.serviceId),
    );
  }
}
