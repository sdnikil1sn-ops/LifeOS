import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {

  const DashboardHeader({super.key});

  String greeting() {

    final hour = DateTime.now().hour;

    if (hour < 12) return "Good Morning";

    if (hour < 17) return "Good Afternoon";

    return "Good Evening";

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          greeting(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: 8),

        const Text("Let's make today productive!")

      ],
    );

  }

}