import 'package:flutter/material.dart';
import '../../demo/demo_repository.dart';
import '../bottom_nav_scaffold.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = DemoRepository();
    return BottomNavScaffold(
      index: 1,
      title: 'Rides',
      body: ListView.separated(
        itemCount: repo.recentRides.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final r = repo.recentRides[i];
          return ListTile(
            title: Text('${r.distanceKm.toStringAsFixed(1)} km • ${r.durationMin}m'),
            subtitle: Text('Top ${r.topSpeedKph.toStringAsFixed(1)} km/h'),
            trailing: Text(r.date),
            onTap: () {},
          );
        },
      ),
    );
  }
}
