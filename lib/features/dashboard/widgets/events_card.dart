import 'package:flutter/material.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("AI Class"),
            subtitle: Text("10:00 AM"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Gym"),
            subtitle: Text("6:00 PM"),
          ),
        ],
      ),
    );
  }
}