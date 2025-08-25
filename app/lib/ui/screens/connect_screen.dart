import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  bool _scanning = false;

  Future<bool> _ensureBlePermissions(BuildContext context) async {
    final statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse, // needed for pre-Android 12 scanning
      Permission.notification,      // optional (alerts)
    ].request();

    // FIX: check the values of the returned Map
    final granted = statuses.values.every((status) => status.isGranted || status.isLimited);

    if (!granted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissions are required to scan/connect')),
      );
    }
    return granted;
  }

  Future<void> _startScan() async {
    if (!await _ensureBlePermissions(context)) return;
    try {
      setState(() => _scanning = true);
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 6),
        androidUsesFineLocation: true,
      );
    } finally {
      if (mounted) setState(() => _scanning = false);
    }
  }

  void _stopScan() {
    FlutterBluePlus.stopScan();
    if (mounted) setState(() => _scanning = false);
  }

  Future<void> _connectTo(ScanResult r) async {
    try {
      _stopScan();
      await r.device.connect(timeout: const Duration(seconds: 10));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/ride');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connect failed: $e')),
      );
    }
  }

  void _demo() {
    Navigator.pushReplacementNamed(context, '/ride');
  }

  @override
  void dispose() {
    _stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = Column(
      children: [
        SvgPicture.asset('assets/icons/ble_board.svg', width: 48, height: 48),
        const SizedBox(height: 8),
        Text(_scanning ? 'Scanning for boards…' : 'No boards connected'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _scanning ? _stopScan : _startScan,
              icon: Icon(_scanning ? Icons.stop : Icons.search),
              label: Text(_scanning ? 'Stop' : 'Scan'),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: _demo,
              child: const Text('Demo Mode'),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Connect')),
      body: Column(
        children: [
          const SizedBox(height: 24),
          header,
          const Divider(height: 24),
          Expanded(
            child: StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.scanResults,
              initialData: const [],
              builder: (context, snapshot) {
                final results = snapshot.data ?? const [];
                if (results.isEmpty) {
                  return const Center(child: Text('No devices found yet'));
                }
                return ListView.separated(
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final r = results[i];
                    final name = r.device.platformName.isNotEmpty
                        ? r.device.platformName
                        : '(Unnamed)';
                    return ListTile(
                      leading: const Icon(Icons.bluetooth),
                      title: Text(name),
                      subtitle: Text('${r.device.remoteId.str}  •  RSSI ${r.rssi}'),
                      trailing: ElevatedButton(
                        onPressed: () => _connectTo(r),
                        child: const Text('Connect'),
                      ),
                      onTap: () => _connectTo(r),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
