import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'dto.dart';

/// Simple offline-first cloud synchroniser.
///
/// The implementation is deliberately lightweight and avoids any
/// platform-specific dependencies so it can run in unit tests.
class CloudSync {
  CloudSync({http.Client? client, String? baseUrl, String? apiKey})
      : _client = client ?? http.Client(),
        _baseUrl = baseUrl ?? _env('XRAY_CLOUD_URL'),
        _apiKey = apiKey ?? _env('XRAY_API_KEY');

  final http.Client _client;
  final String? _baseUrl;
  final String? _apiKey;

  bool get isEnabled => _baseUrl != null && _apiKey != null;

  /// Push a batch of rides to the cloud endpoint.
  Future<void> pushRides(List<RideDTO> rides) async {
    if (!isEnabled || rides.isEmpty) return;
    final uri = Uri.parse('$_baseUrl/rides');
    final body = jsonEncode({'rides': rides.map((r) => r.toJson()).toList()});
    final resp = await _client.post(uri,
        headers: _headers(), body: body).timeout(const Duration(seconds: 20));
    if (resp.statusCode != 200) {
      throw HttpException('push failed: ${resp.statusCode}');
    }
  }

  /// Pull rides updated since [since] from the cloud endpoint.
  Future<List<RideDTO>> pullRides(int since) async {
    if (!isEnabled) return const [];
    final uri = Uri.parse('$_baseUrl/rides?since=$since');
    final resp = await _client
        .get(uri, headers: _headers())
        .timeout(const Duration(seconds: 20));
    if (resp.statusCode != 200) {
      throw HttpException('pull failed: ${resp.statusCode}');
    }
    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    final list = (data['rides'] as List<dynamic>?) ?? const [];
    return list.map((e) => RideDTO.fromJson(e as Map<String, dynamic>)).toList();
  }

  Map<String, String> _headers() => {
        'Authorization': 'Bearer ${_apiKey!}',
        'Content-Type': 'application/json',
      };

  /// Best-effort delete of all remote data for this user.
  Future<void> deleteCloudData() async {
    if (!isEnabled) return;
    final uri = Uri.parse('$_baseUrl/user');
    await _client.delete(uri, headers: _headers()).timeout(const Duration(seconds: 20));
  }
}

String? _env(String key) {
  // Prefer runtime env but fall back to compile-time defines.
  return Platform.environment[key] ?? const String.fromEnvironment(key);
}

/// Merge helper implementing last-write-wins using [updatedAt].
RideDTO resolveConflict(RideDTO a, RideDTO b) {
  return a.updatedAt >= b.updatedAt ? a : b;
}
