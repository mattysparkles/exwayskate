import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rides')),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) => const ListTile(
          // TODO: Add ride thumbnail asset (e.g. assets/images/ride_thumbnail.png)
          title: Text('Ride'),
        ),
      ),
    );
  }
}
