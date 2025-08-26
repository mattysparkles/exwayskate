import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../demo/demo_repository.dart';
import '../../models/telemetry.dart';
import '../../settings/app_settings.dart';
import '../bottom_nav_scaffold.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  late final Stream<Telemetry> _stream;
  final _speedHistory = <FlSpot>[];
  final _ampHistory = <FlSpot>[];
  int _idx = 0;

  @override
  void initState() {
    super.initState();
    _stream = DemoRepository().telemetryStream();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    return BottomNavScaffold(
      index: 0,
      title: 'Ride',
      body: StreamBuilder<Telemetry>(
        stream: _stream,
        builder: (context, snapshot) {
          final t = snapshot.data;
          if (t != null) {
            _speedHistory.add(FlSpot(_idx.toDouble(), t.speedMps));
            _ampHistory.add(FlSpot(_idx.toDouble(), t.amps));
            _idx++;
            if (_speedHistory.length > 300) {
              _speedHistory.removeAt(0);
              _ampHistory.removeAt(0);
            }
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (settings.demoMode)
                const Align(
                  alignment: Alignment.center,
                  child: Chip(label: Text('Demo board connected')),
                ),
              const SizedBox(height: 12),
              _statGrid(t),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _speedHistory,
                        isCurved: true,
                        color: Colors.lightBlueAccent,
                        dotData: FlDotData(show: false),
                      ),
                      LineChartBarData(
                        spots: _ampHistory,
                        isCurved: true,
                        color: Colors.greenAccent,
                        dotData: FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _statGrid(Telemetry? t) {
    final speed = t?.speedMps ?? 0;
    final volts = t?.volts ?? 0;
    final amps = t?.amps ?? 0;
    final esc = t?.escTempC ?? 0;
    final motor = t?.motorTempC ?? 0;
    final powerKw = volts * amps / 1000;
    final range = (volts - 30) * 2; // crude
    final fault = t?.faultsBits ?? 0;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _card('Speed', '${(speed * 3.6).toStringAsFixed(1)} km/h'),
        _card('Battery', '${(volts / 42 * 100).toStringAsFixed(0)}%'),
        _card('Temps', 'ESC ${esc.toStringAsFixed(0)}°C / M ${motor.toStringAsFixed(0)}°C'),
        _card('Power', '${powerKw.toStringAsFixed(1)} kW'),
        _card('Range ETA', '${range.toStringAsFixed(0)} km'),
        if (fault != 0) _card('Fault', 'Code $fault'),
      ],
    );
  }

  Widget _card(String title, String value) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
