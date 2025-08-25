import 'package:flutter/material.dart';
import '../../ble/mock_profile.dart';
import '../../models/telemetry.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  final _profile = MockProfile();
  late final Stream<Telemetry> _stream;

  @override
  void initState() {
    super.initState();
    _stream = _profile.startMockStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride')),
      body: StreamBuilder<Telemetry>(
        stream: _stream,
        builder: (context, snapshot) {
          final t = snapshot.data;
          final speed = t?.speedMps ?? 0;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Display speed gauge asset (e.g. assets/images/speed_gauge.png)
                Text('${speed.toStringAsFixed(1)} m/s',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/modes'),
                  child: const Text('Modes'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
