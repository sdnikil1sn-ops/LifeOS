import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LifeOS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.track_changes,
              size: 90,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to LifeOS",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Your Personal Productivity Operating System",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}